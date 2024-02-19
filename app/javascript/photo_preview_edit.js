function addPhotoInput() {
    const productPhotoPreviewContainer = document.getElementById('product-photo-preview-new');
    if (!productPhotoPreviewContainer) {
        console.error('Could not find product photo preview container');
        return;
    }

    const dynamicName = 'productPhotoInputNew' + Date.now();
    const dynamicPreview = 'productPhotoPreviewNew' + Date.now();

    const previousInput = document.getElementById(dynamicName);
    const previousPreview = document.getElementById(dynamicPreview);
    if (previousInput) {
        previousInput.remove();
    }
    if (previousPreview) {
        previousPreview.remove();
    }

    const input = document.createElement('input');
    input.type = 'file';
    input.id = dynamicName;

    const preview = document.createElement('div');
    preview.id = dynamicPreview;

    productPhotoPreviewContainer.appendChild(input);
    productPhotoPreviewContainer.appendChild(preview);

    input.addEventListener('change', function (event) {
        const file = event.target.files[0];
        const reader = new FileReader();

        reader.onload = function (e) {
            const img = document.createElement('img');
            img.src = e.target.result;
            preview.innerHTML = '';
            preview.appendChild(img);
        };

        reader.readAsDataURL(file);
    });
}

addPhotoInput();