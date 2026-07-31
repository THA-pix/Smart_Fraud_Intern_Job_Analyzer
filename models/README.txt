This folder was NOT included in your upload (static__2_.zip only contained
static/ and templates/). Place these three files here before running the app:

  - image_model.h5       (Keras image-classification model)
  - simple_model.pkl     (pickled sklearn model for CSV/manual predictions)
  - simple_encoders.pkl  (pickled encoders used with simple_model.pkl)

The app now starts even without these files (it prints a warning instead of
crashing), but image-based prediction will report "Error in Prediction"
until image_model.h5 is placed here.
