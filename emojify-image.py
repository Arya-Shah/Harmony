import numpy as np
import cv2
from keras.models import Sequential
from keras.layers import Dense, Dropout, Flatten
from keras.layers import Conv2D
from keras.optimizers import Adam
from keras.layers import MaxPooling2D
from keras.preprocessing.image import ImageDataGenerator
#declaring the path to the dataset
train_dir = 'data/train'
val_dir = 'data/test'
train_datagen = ImageDataGenerator(rescale=1./255)
val_datagen = ImageDataGenerator(rescale=1./255)

train_generator = train_datagen.flow_from_directory(
        train_dir,
        target_size=(48,48),
        batch_size=64,
        color_mode="grayscale",
        class_mode='categorical')

validation_generator = val_datagen.flow_from_directory(
        val_dir,
        target_size=(48,48),
        batch_size=64,
        color_mode="grayscale",
        class_mode='categorical')
#Using Sequential Algorithm
emotion_model = Sequential()
#Reused Code
emotion_model.add(Conv2D(32, kernel_size=(3, 3), activation='relu', input_shape=(48,48,1)))
emotion_model.add(Conv2D(64, kernel_size=(3, 3), activation='relu'))
emotion_model.add(MaxPooling2D(pool_size=(2, 2)))
emotion_model.add(Dropout(0.25))

emotion_model.add(Conv2D(128, kernel_size=(3, 3), activation='relu'))
emotion_model.add(MaxPooling2D(pool_size=(2, 2)))
emotion_model.add(Conv2D(128, kernel_size=(3, 3), activation='relu'))
emotion_model.add(MaxPooling2D(pool_size=(2, 2)))
emotion_model.add(Dropout(0.25))

emotion_model.add(Flatten())
emotion_model.add(Dense(1024, activation='relu'))
emotion_model.add(Dropout(0.5))
emotion_model.add(Dense(7, activation='softmax'))
emotion_model.load_weights('emotion_model.h5') #Loading weights from file

cv2.ocl.setUseOpenCL(False)
#Declaring Emotions & emojis
emotion_dict = {0: "Angry", 1: "Disgusted", 2: "Fearful", 3: "Happy", 4: "Neutral", 5: "Sad", 6: "Surprised"}
emoji_dist={0:"emojis/angry.png",2:".emojis/disgusted.png",2:"emojis/fearful.png",3:"emojis/happy.png",4:"emojis/neutral.png",5:"emojis/sad.png",6:"emojis/surpriced.png"}
#Training the model using dataset
emotion_model.compile(loss='categorical_crossentropy',optimizer=Adam(lr=0.0001, decay=1e-6),metrics=['accuracy'])
#emotion_model_info = emotion_model.fit_generator(
#        train_generator,                                                       #Commented because the model weights have been saved to "emotion_model.h5" file
#        steps_per_epoch=28709 // 64,
#        epochs=50,
#        validation_data=validation_generator,
#        validation_steps=7178 // 64)
emotion_model.save_weights('emotion_model.h5')#saving model weights



# start the webcam feed
cap = cv2.VideoCapture(0)
alpha = 0
while True:
    # Find haar cascade to draw bounding box around face
    ret, frame = cap.read()
    frame = cv2.flip(frame, 1)
    if not ret:
        break
    bounding_box = cv2.CascadeClassifier('haarcascade_frontalface_default.xml') #file used to draw bounding box around the human face
    gray_frame = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY) #convert the frame captured to grayscale
    num_faces = bounding_box.detectMultiScale(gray_frame,scaleFactor=1.3, minNeighbors=5)
#Reused Code
    for (x, y, w, h) in num_faces:
        cv2.rectangle(frame, (x, y-50), (x+w, y+h+10), (255, 0, 0), 2)
        roi_gray_frame = gray_frame[y:y + h, x:x + w]
        cropped_img = np.expand_dims(np.expand_dims(cv2.resize(roi_gray_frame, (48, 48)), -1), 0)
        emotion_prediction = emotion_model.predict(cropped_img)
        maxindex = int(np.argmax(emotion_prediction))
        #print(maxindex)
        img = cv2.imread(emoji_dist[maxindex])
        foreground = img
        #cv2.putText(frame, emotion_dict[maxindex], (x+20, y-60), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2, cv2.LINE_AA)

        added_image = cv2.addWeighted(frame[0:150,0:150,:],alpha,foreground[0:150,0:150,:],1-alpha,0) #to overlay image on the opencv videocapture
        frame[0:150, 0:150] = added_image

        cv2.putText(frame, emotion_dict[maxindex], (10, 180), cv2.FONT_HERSHEY_DUPLEX, 1, (255, 255, 255), 2, cv2.LINE_AA) #to put text on videocapture
    #cv2.rectangle()


    cv2.putText(frame, "Press 'Esc' to exit", (450, 30), cv2.FONT_HERSHEY_PLAIN, 1, (0,0,0), 1, cv2.LINE_AA)
    cv2.imshow('Photo To Emoji Live', cv2.resize(frame,(1200,860),interpolation = cv2.INTER_CUBIC))

    if cv2.waitKey(1) == 27: #ASCII for 'Esc' key
        break

cap.release()
cv2.destroyAllWindows()