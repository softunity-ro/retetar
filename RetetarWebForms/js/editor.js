Quill.register('modules/blotFormatter', QuillBlotFormatter.default);

var toolbarOptions = [
    [{'font': []}],                                     // font
    [{'size': ['small', false, 'large', 'huge']}],      // marime
    ['bold', 'italic', 'underline', 'strike'],          // stil
    [{'color': []}, {'background': []}],                // culoare
    [{align: ''}, {align: 'center'},
        {align: 'right'}, {align: 'justify'}],          // aliniere
    [{'indent': '-1'}, {'indent': '+1'}],               // outdent/indent
    [{'list': 'ordered'}, {'list': 'bullet'}],          // liste
    [{'script': 'sub'}, {'script': 'super'}],           // superscript/subscript
    [{'header': [1, 2, 3, 4, 5, 6, false]}],            // headers
    ['blockquote', 'code-block'],                       // code
    ['image', 'video'],                                 // media
    // [{'direction': 'rtl'}],                          // directie text
    ['clean'],                                           // sterge formatarea


];


var editor = new Quill('#RecipeContent', {
    modules: {
        formula: true,
        syntax: true,
        toolbar: toolbarOptions,
        blotFormatter: {
            overlay: {
                style: {
                    border: '4px solid #008000',
                }
            }
        }
    },
    // placeholder: 'Continutul retetei...',
    theme: 'snow'
});

var toolbar = editor.getModule('toolbar');
toolbar.addHandler('image', function () {
    var fileInput = document.createElement('input');
    fileInput.setAttribute('type', 'file');
    fileInput.setAttribute('accept', 'image/*');
    fileInput.setAttribute('style', 'display:none');
    document.body.appendChild(fileInput);

    fileInput.click();
    fileInput.onchange = function () {
        var file = fileInput.files[0];
        var formData = new FormData();
        formData.append('file', file);
        fetch('/ImageUpload.aspx', {
            method: 'POST',
            body: formData
        })
            .then(response => response.json())
            .then(result => {
                editor.insertEmbed(editor.getSelection().index, 'image', result.imageUrl);
            })
            .catch(error => console.log(error));
    }
});

// select the target node
var target = document.querySelector('.ql-editor');
var content = document.getElementById("Content");

// create an observer instance
var observer = new MutationObserver(function (mutations) {

    content.value = target.innerHTML;
    // console.log("Change detected", target.innerHTML);
    // console.log("Input value is", content.value);
});

// configuration of the observer:
var config = {attributes: true, childList: true, characterData: true, subtree: true};

// pass in the target node, as well as the observer options
observer.observe(target, config);

$(document).ready(function () {
    target.innerHTML = content.value;
    // console.log(content.value);
});


//drag and drop
const editorContainer = document.querySelector('#RecipeContent');

editorContainer.addEventListener('dragover', (event) => {
    event.preventDefault();
    event.dataTransfer.dropEffect = 'copy';
});

editorContainer.addEventListener('drop', (event) => {
    event.preventDefault();
    // console.log("The data dropped is: ", event.dataTransfer.types);
    const files = event.dataTransfer.files;
    const quillSelection = editor.getSelection();

    for (let i = 0; i < files.length; i++) {
        const file = files[i];

        if (file.type.includes('image')) {
            const reader = new FileReader();

            reader.onload = () => {
                const img = document.createElement('img');
                img.setAttribute('src', reader.result);

                const range = quillSelection ? quillSelection : editor.getSelection();
                editor.insertEmbed(range.index, 'image', reader.result);
            };

            reader.readAsDataURL(file);
        } else if (file.type.includes('video')) {
            const reader = new FileReader();

            reader.onload = () => {
                const video = document.createElement('video');
                video.setAttribute('src', reader.result);
                video.setAttribute('controls', true);

                const range = quillSelection ? quillSelection : editor.getSelection();
                editor.insertEmbed(range.index, 'video', reader.result);
            };

            reader.readAsDataURL(file);
        } else {
            console.log("This can not be dropped", file);
        }
    }
});
