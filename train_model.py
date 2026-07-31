import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.preprocessing import LabelEncoder
import pickle

# Load dataset
df = pd.read_csv("dataset.csv")

# Select ONLY 7 features
df = df[[
    "Job_Title",
    "Company_Name",
    "Salary",
    "Registration_Required",
    "Registration_Fee",
    "Email_Domain_Type",
    "Suspicious_Keyword_Count",
    "Prediction_Label"
]]

# Encode categorical
le_dict = {}

for col in df.columns:
    if df[col].dtype == "object":
        le = LabelEncoder()
        df[col] = le.fit_transform(df[col].astype(str))
        le_dict[col] = le

# Split
X = df.drop("Prediction_Label", axis=1)
y = df["Prediction_Label"]

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)

# Train
model = RandomForestClassifier(n_estimators=100)
model.fit(X_train, y_train)

# Save
pickle.dump(model, open("models/simple_model.pkl", "wb"))
pickle.dump(le_dict, open("models/simple_encoders.pkl", "wb"))

print("✅ SIMPLE MODEL TRAINED")
