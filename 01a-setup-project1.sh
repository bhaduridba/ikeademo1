#!/usr/bin/env bash
## use pip to install required libraries
## ************************************************* ##
## enable Cloud Build API before running the process ##
## ************************************************* ##

# Setup environment
gcloud config set account 'bhaduridba@gmail.com'

gcloud components update
#export PROJECT_ID1=$(gcloud config get-value project)
#gcloud config set project $PROJECT_ID1

export PROJECT_ID1='ikeademo1'
echo $PROJECT_ID1

gcloud config set project $PROJECT_ID1

export SOURCE_SYSTEM='iSOM'
export APP_NAME='cleveron'
export REGION=us-central1

export PROJECT_ID2='ikeademo2'
echo $PROJECT_ID2

#gcloud config set project $PROJECT_ID2

export SOURCE='cleveron'
export FILES_SOURCE=${PROJECT_ID2}-${SOURCE}-files-source-$(date +%s)

echo $FILES_SOURCE
#export FILES_SOURCE=${SOURCE_SYSTEM}-${PROJECT_ID}-files-source-$(date +%s)

TOPIC_ID=${SOURCE_SYSTEM}-${APP_NAME}
echo $TOPIC_ID

export AE_REGION=us-central1

# Create a Cloud Storage bucket owned by DSM  project
gsutil mb gs://$FILES_SOURCE

##Create a Pub/Sub topic in project 1
#gcloud pubsub topics create $TOPIC_ID

##Create an App Engine app for the project:
#gcloud app create --region=$AE_REGION

#Create a Cloud Scheduler job in this project. The job publishes a message to a Pub/Sub topic at one-minute intervals.
export LOCATION=$REGION
export SCHEDULE="* * * * *"
export MESSAGE_BODY_FROM_FILE=/Users/sobhan/Documents/projects/ikeademo2/test_files/data.json

#gcloud scheduler jobs create pubsub cleveron-publisher-job --location=$LOCATION --schedule=$SCHEDULE  \
#  				      --topic=$TOPIC_ID  \
#				     --message-body-from-file=$MESSAGE_BODY_FROM_FILE

#gcloud scheduler jobs run cleveron-publisher-job

## clone the codebase repository and navigate to the sample code directory
#virtualenv env
#source env/bin/activate
# git clone https://github.com/GoogleCloudPlatform/python-docs-samples.git
#cd python-docs-samples/pubsub/streaming-analytics
#pip install -U -r requirements.txt  # Install Apache Beam dependencies

