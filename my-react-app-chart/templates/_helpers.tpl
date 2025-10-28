{{- define "my-react-app.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "my-react-app.fullname" -}}
{{- printf "%s-%s" .Release.Name (include "my-react-app.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "my-react-app.labels" -}}
app.kubernetes.io/name: {{ include "my-react-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | default .Chart.Version }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}