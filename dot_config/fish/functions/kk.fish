function kk \
  --description 'Output k8s cluster/namespace'

  set k8s_ctx (kubectl config current-context)
  set k8s_ns (kubectl config view -o=jsonpath="{.contexts[?(@.name==\"$k8s_ctx\")].context.namespace}")

  printf "%s/%s" $k8s_ctx $k8s_ns
end
