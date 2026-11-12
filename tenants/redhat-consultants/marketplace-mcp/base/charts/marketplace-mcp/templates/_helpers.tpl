{{- define "marketplace-mcp.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "marketplace-mcp.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- include "marketplace-mcp.name" . -}}
{{- end -}}
{{- end -}}

{{- define "marketplace-mcp.labels" -}}
app.kubernetes.io/name: {{ include "marketplace-mcp.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "marketplace-mcp.selectorLabels" -}}
app: {{ include "marketplace-mcp.fullname" . }}
{{- end -}}
