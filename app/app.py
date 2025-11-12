from flask import Flask, request, jsonify

app = Flask(__name__)

# Temporary storage (in-memory dictionary)
users_db = {}

# Home route
@app.route('/')
def home():
    return "Welcome to the Flask User API!"

@app.route('/register', methods=['POST'])
def register_user():
    data = request.get_json()

    username = data.get('username')
    email = data.get('email')

    if not username or not email:
        return jsonify({"error": "Missing username or email"}), 400

    if username in users_db:
        return jsonify({"error": "User already exists"}), 409

    # Save user
    users_db[username] = {"username": username, "email": email}
    return jsonify({"message": "User registered successfully!"}), 201

@app.route('/user/<username>', methods=['GET'])
def get_user(username):
    user = users_db.get(username)
    if not user:
        return jsonify({"error": "User not found"}), 404

    return jsonify(user)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
