from flask import Flask, render_template, request, session, redirect, url_for
import os

app = Flask(__name__)
app.secret_key = 'your_secret_key_here'  # ضع مفتاح سري هنا

@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        # التحقق من كلمة السر
        if request.form['password'] == '2002':
            session['authenticated'] = True
            return redirect(url_for('message'))
        else:
            return render_template('login.html', error='كلمة السر غير صحيحة')
    
    return render_template('login.html')

@app.route('/message')
def message():
    # إذا لم يكن المستخدم قد أدخل كلمة السر، نعيده إلى الصفحة الرئيسية
    if not session.get('authenticated'):
        return redirect(url_for('index'))
    
    return render_template('message.html')

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)