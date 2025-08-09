import os
from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello():
    return os.environ.get("APP_GREETING", "Hello, default!")

if __name__ == "__main__":
    # Run the app on all interfaces (required inside containers)
    app.run(host="0.0.0.0", port=5000)

