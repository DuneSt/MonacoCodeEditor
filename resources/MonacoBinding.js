
window.addEventListener("load", () => {
  require.config({ paths: { vs: "https://cdnjs.cloudflare.com/ajax/libs/monaco-editor/0.27.0/min/vs" } });

  require(["vs/editor/editor.main"], function () {
    MonacoBinding.initEditors()
  });
})

class MonacoBinding {
  static editorsByIds = new Map()

  static initEditors() {
    const containers = document.getElementsByClassName("monaco-container")
    for (let container of containers) {
      let editorElement = container.getElementsByClassName("monaco-container-editor")[0]
      editorElement.innerHTML = ""
      let editor = monaco.editor.create(editorElement, {
        value: editorElement.dataset.code,
        language: editorElement.dataset.language || "markdown"
      })
      this.editorsByIds.set(container, editor)
    }
  }

  static getContentFor(saveButtonElement) {
    let containerElement = saveButtonElement.parentElement
    let editor = this.editorsByIds.get(containerElement)
    if(editor) {
      return editor.getValue()
    } else {
      console.error(new Error("editor not found"), {containerElement})
    }
  }

  static save(saveButtonElement) {
    document.body.style.cursor = "progress"
    saveButtonElement.style.cursor = "not-allowed"
    return this.getContentFor(saveButtonElement)
  }

  static saveCompleted(saveButtonElement) {
    document.body.style.cursor = "default"
    saveButtonElement.style.cursor = "default"
  }

  static saveFailed(saveButtonElement) {
    document.body.style.cursor = "default"
    saveButtonElement.style.cursor = "default"
  }

}
