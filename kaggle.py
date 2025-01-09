import kagglehub

# Download latest version
path = kagglehub.dataset_download("keremkarayaz/coffee-shop-sales")

print("Path to dataset files:", path)
