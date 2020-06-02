apiVersion: apps/v1
kind: Deployment
metadata:
  name: qserv-operator
spec:
  replicas: 1
  selector:
    matchLabels:
      name: qserv-operator
  template:
    metadata:
      labels:
        name: qserv-operator
    spec:
      serviceAccountName: qserv-operator
      containers:
        - name: qserv-operator
          # Replace this with the built image name
          image: REPLACE_IMAGE
          command:
          - qserv-operator
          imagePullPolicy: IfNotPresent
          env:
            - name: WATCH_NAMESPACE
              valueFrom:
                fieldRef:
                  fieldPath: metadata.namespace
            - name: POD_NAME
              valueFrom:
                fieldRef:
                  fieldPath: metadata.name
            - name: OPERATOR_NAME
              value: "qserv-operator"
