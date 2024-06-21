#!/bin/bash

if [ -z "$1" ]; then 
  namespace=$(kubectl get namespaces | awk '{print $1}' | grep -vE 'NAME' | fzf)
  echo "$namespace"
else
  namespace=$(kubectl get namespaces | awk '{print $1}' | grep -vE 'NAME' | fzf --query="$1" --select-1)
fi

pod_name=$(kubectl get pods -A | grep "$namespace" | grep -vE '\-db|shopdb|centerdb|phpmyadmin|rabbitmq|mailcatcher|redis|init' | awk '{print $2}')

echo -n "$pod_name" | xclip 
