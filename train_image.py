import tensorflow as tf
from tensorflow.keras.preprocessing.image import ImageDataGenerator
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Conv2D, MaxPooling2D, Flatten, Dense

IMG_SIZE = (128,128)

datagen = ImageDataGenerator(rescale=1./255, validation_split=0.2)

train = datagen.flow_from_directory(
    "images/",
    target_size=IMG_SIZE,
    batch_size=32,
    class_mode="binary",
    subset="training"
)

val = datagen.flow_from_directory(
    "images/",
    target_size=IMG_SIZE,
    batch_size=32,
    class_mode="binary",
    subset="validation"
)

model = Sequential([
    Conv2D(32,(3,3),activation='relu',input_shape=(128,128,3)),
    MaxPooling2D(2,2),

    Conv2D(64,(3,3),activation='relu'),
    MaxPooling2D(2,2),

    Flatten(),
    Dense(128,activation='relu'),
    Dense(1,activation='sigmoid')
])

model.compile(optimizer='adam', loss='binary_crossentropy', metrics=['accuracy'])

model.fit(train, validation_data=val, epochs=5)

model.save("models/image_model.h5")

print("✅ Image Model Trained")
