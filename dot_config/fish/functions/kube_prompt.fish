function kube_prompt \
  --description 'Output k8s cluster/namespace'

  set -l k8s_ctx (command yq '.current-context' ~/.kube/config)
  set -l k8s_ns (command yq ".contexts[] | select(.name == \"$k8s_ctx\").context.namespace" ~/.kube/config)

  printf "%s/%s" $k8s_ctx $k8s_ns
end
