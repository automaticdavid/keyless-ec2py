FROM 	python:2
RUN	mkdir /base
COPY	. /base
RUN 	pip install -r /base/requirements.txt
ARG 	SERVICE_NAME
ARG 	SERVICE_VERSION
ENV 	SERVICE_NAME $SERVICE_NAME
ENV 	SERVICE_VERSION $SERVICE_VERSION
ARG 	AWS_ACCESS_KEY_ID
ARG 	AWS_SECRET_ACCESS_KEY
ENV 	AWS_ACCESS_KEY_ID $AWS_ACCESS_KEY_ID
ENV 	AWS_SECRET_ACCESS_KEY $AWS_SECRET_ACCESS_KEY
RUN 	mkdir /app
COPY 	. /app
RUN	chmod 755 /app/app/ec2.py
RUN	chmod 755 /app/app.sh
WORKDIR	/app/app
EXPOSE  5000 
# ENTRYPOINT ["/usr/local/bin/gunicorn", "--config", "gunicorn_config.py", "app:app"]
CMD	["/app/app.sh"]
