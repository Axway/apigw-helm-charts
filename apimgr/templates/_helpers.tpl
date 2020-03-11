{{- define "imagePullSecret" }}
{{- printf "{\"auths\": {\"%s\": {\"auth\": \"%s\"}}}" .Values.imageCredentials.registry (printf "%s:%s"  (required "A valid .Values.imageCredentials.username entry is required!" .Values.imageCredentials.username) (required "A valid .Values.imageCredentials.password entry is required!" .Values.imageCredentials.password) | b64enc) | b64enc }}
{{- end }}