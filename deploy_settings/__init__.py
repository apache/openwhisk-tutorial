import os

vcap = os.environ

if "VCAP_APPLICATION" in os.environ:
    from deploy_settings.bluemix import *
    print("Bluemix")
else:
    print("Defaulting to local")
    from deploy_settings.base import *


DATABASES = {

}
