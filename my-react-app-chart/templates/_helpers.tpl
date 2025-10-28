{{- define "my-react-app.fullname" -}}
{{- printf "%s" .Release.Name -}}
{{- end -}}