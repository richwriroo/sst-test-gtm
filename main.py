import functions_framework
from flask import render_template

@functions_framework.http
def app(request):
    render_template('index.html', content="Hello World!")

