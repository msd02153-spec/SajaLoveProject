from flask import Flask, render_template, request, redirect, url_for

app = Flask(__name__)

PASSWORD = "2002"

@app.route("/", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        if request.form["password"] == PASSWORD:
            return redirect(url_for("page1"))
        else:
            return "Wrong password"
    return render_template("login.html")

@app.route("/page1")
def page1():
    return render_template("page1.html")

@app.route("/page2")
def page2():
    return render_template("page2.html")

@app.route("/page3")
def page3():
    return render_template("page3.html")

@app.route("/page4")
def page4():
    return render_template("page4.html")

@app.route("/yes")
def yes():
    return "😍😍😍"

@app.route("/no")
def no():
    return "💔"

if __name__ == "__main__":
    app.run(debug=True)
