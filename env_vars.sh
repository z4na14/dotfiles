export WLR_RENDERER_ALLOW_SOFTWARE=1
export GBM_BACKEND=nvidia-drm
export __GLX_VENDOR_LIBRARY_NAME=nvidia
export LIBVA_DRIVER_NAME=nvidia
export WLR_NO_HARDWARE_CURSORS=1

# Electron flickering apps
export ELECTRON_OZONE_PLATFORM_HINT=auto
export NVD_BACKEND=direct # Enable hardware video acceleration

export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket
