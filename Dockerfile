FROM gardendev/garden-aws
COPY --from=lachlanevenson/k8s-kubectl /usr/local/bin/kubectl /usr/local/bin/kubectl
RUN apk add --no-cache curl openssh 
RUN curl -o aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.18.8/2020-09-18/bin/darwin/amd64/aws-iam-authenticator
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
