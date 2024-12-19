{{/*
Expand the name of the chart.
*/}}
{{- define "k8s-token.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "k8s-token.fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "k8s-token.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "k8s-token.labels" -}}
helm.sh/chart: {{ include "k8s-token.chart" . }}
{{- with .Values.md_metadata.default_tags }}
{{ toYaml . }}
{{- end }}
app.kubernetes.io/deployed-with: massdriver.cloud
{{- end }}
