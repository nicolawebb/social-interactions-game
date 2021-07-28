
Local logging
-------------

*Pre-requisites:* Flask (`sudo apt install python3-flask`), `sqlite3`

To start the server:

```
export FLASK_APP=app.py
flask run --host=0.0.0.0 --port=8080
```


On the server
-------------

- `sudo apt install nginx uwsgi uwsgi-plugin-python3`
- `uwsgi --ini logging-server.ini`

