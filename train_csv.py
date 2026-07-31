import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.preprocessing import LabelEncoder
import pickle

# Load dataset
df = pd.read_csv("dataset.csv")

# Convert dates
df["Posted_Date"] = pd.to_datetime(df["Posted_Date"], format="%d-%m-%y", errors="coerce")
df["Application_Deadline"] = pd.to_datetime(df["Application_Deadline"], format="%d-%m-%y", errors="coerce")

df["Posted_Date"] = df["Posted_Date"].map(lambda x: x.toordinal() if pd.notnull(x) else 0)
df["Application_Deadline"] = df["Application_Deadline"].map(lambda x: x.toordinal() if pd.notnull(x) else 0)

# Drop non-useful columns
df = df.drop(columns=["Job_ID", "Image_Path"])

# Fill missing
df = df.fillna("Unknown")

# Encode categorical columns
le_dict = {}

for col in df.columns:
    if df[col].dtype == "object":
        le = LabelEncoder()
        df[col] = le.fit_transform(df[col].astype(str))
        le_dict[col] = le

# Save encoders
with open("models/encoders.pkl", "wb") as f:
    pickle.dump(le_dict, f)

# Split
X = df.drop("Prediction_Label", axis=1)
y = df["Prediction_Label"]

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)

# Train model
model = RandomForestClassifier(n_estimators=150)
model.fit(X_train, y_train)

# Save model
with open("models/csv_model.pkl", "wb") as f:
    pickle.dump(model, f)

print("✅ CSV Model Trained Successfully")
