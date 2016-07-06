# 
#   Copyright 2015-2016 IBM Corporation
#  
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#  
#   http://www.apache.org/licenses/LICENSE-2.0
#  
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#  


# settings/bluemix.py
from deploy_settings.base import *
import os.path, os, json, urlparse

print "using bluemix settings"

MEDIA_URL = '/media/'
MEDIA_ROOT = '/home/vcap/bluemix/data/media/'
STATIC_ROOT = '/home/vcap/bluemix/volatile/static/'
STATIC_URL = '/static/'

#Bluemix Service Connection Info
vcap_host = os.environ.get('VCAP_APP_HOST')
vcap_port = os.environ.get('VCAP_APP_PORT')

DATABASES = {
}


log_file_dir = PROJECT_ROOT.child('docker_index.log')

LOGGING = {
    'version': 1,
    'disable_existing_loggers': True,
    'filters': {
     'require_debug_false': {
         '()': 'django.utils.log.RequireDebugFalse'
     }
    },
    'formatters': {
        'verbose': {
            'format': '%(levelname)s %(asctime)s %(module)s %(process)d %(thread)d %(message)s'
        },
        'simple': {
            'format': '%(levelname)s %(message)s'
        },
    },
    'handlers': {
        'null': {
            'level':'DEBUG',
            'class':'django.utils.log.NullHandler',
        },
        'console': {
            'level': 'DEBUG',
            'class': 'logging.StreamHandler',
            'formatter': 'verbose'
        },
        'log_file': {
            'level': 'DEBUG',
            'class': 'logging.handlers.RotatingFileHandler',
            'formatter': 'verbose',
            'filename': log_file_dir,
            'maxBytes': 1024*1024*25, # 25 MB
            'backupCount': 5,
        },
        'mail_admins': {
            'level': 'ERROR',
            'filters': ['require_debug_false'],
            'class': 'django.utils.log.AdminEmailHandler'
        }
    },
    'loggers': {
        'django': {
            'handlers': ['console', 'log_file', 'mail_admins'],
            'level': 'DEBUG',
            'propagate': True,
        },
        'django.request': {
            'handlers': ['console', 'log_file', 'mail_admins'],
            'level': 'ERROR',
            'propagate': False,
        },
        'django.db.backends': {
            'handlers': ['console', 'log_file', 'mail_admins'],
            'level': 'INFO',
            'propagate': False,
        },
        # Catch All Logger -- Captures any other logging
        '': {
            'handlers': ['console', 'log_file', 'mail_admins'],
            'level': 'DEBUG',
            'propagate': True,
        }
    }
}
