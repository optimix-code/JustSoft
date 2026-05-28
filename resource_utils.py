import os
import sys

def resource_path(relative_path: str) -> str:
    """Return absolute path for bundled PyInstaller resources and source mode."""
    if getattr(sys, "frozen", False):
        base_path = getattr(sys, "_MEIPASS", os.path.dirname(sys.executable))
    else:
        base_path = os.path.dirname(os.path.abspath(__file__))
    return os.path.join(base_path, relative_path)
