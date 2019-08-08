"""Flask webserver."""
import time
import redis
from flask import Flask

APP = Flask(__name__)
CACHE = redis.Redis(host='redis', port=6379)

def get_hit_count():
    """Connect to Redis and increment count."""
    retries = 5
    while True:
        try:
            return CACHE.incr('hits')
        except redis.exceptions.ConnectionError as exc:
            if retries == 0:
                raise exc
            retries -= 1
            time.sleep(0.5)

@APP.route('/')
def hello():
    """Message send to site."""
    count = get_hit_count()
    return 'Hello World! I have been seen {} times.\n'.format(count)
