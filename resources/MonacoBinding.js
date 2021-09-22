
window.addEventListener("load", () => {
  require.config({ paths: { vs: "https://cdnjs.cloudflare.com/ajax/libs/monaco-editor/0.27.0/min/vs" } });

  require(["vs/editor/editor.main"], function () {
    MonacoBinding.initEditors()
  });
})

class MonacoBinding {
  static initEditors() {
    const containers = document.getElementsByClassName("monaco-container")
    for (let container of containers) {
      console.log(containers, container)
      container.innerHTML = ""
      monaco.editor.create(container, {
        value: container.dataset.code,
        language: container.dataset.language || "markdown"
      })
    }
  }

  saveContentFor(containerElement) {
    console.log(containerElement)
  }

}
