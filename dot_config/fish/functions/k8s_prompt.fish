function k8s_prompt \
  --description 'Output k8s cluster/namespace'

  set -l k8s_prompt

  set k8s_ctx (kubectl config current-context)
  set k8s_ns (kubectl config view -o=jsonpath="{.contexts[?(@.name==\"$k8s_ctx\")].context.namespace}")
  set k8s_prompt "$bold_green$k8s_ctx/$k8s_ns"

  echo $k8s_prompt
end
