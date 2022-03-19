function toolbox_name --description 'Return the name of the toolbox'
  # Assumes Podman/Toolbox currently 
  if string match -q "true" (in_podman)
      echo (grep name /run/.containerenv | cut -d '"' -f2)
      return
  end
  echo ""
end
