{{- define "flask-hello-world.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "flask-hello-world.fullname" -}}
{{- printf "%s-%s" .Release.Name (include "flask-hello-world.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "flask-hello-world.labels" -}}
app.kubernetes.io/name: {{ include "flask-hello-world.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}
