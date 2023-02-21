

const multiStepForm = document.querySelector("[data-multi-step]")
const formSteps = [...multiStepForm.querySelectorAll("[data-step]")]

let currentStep = formSteps.findIndex(step => {
    return step.classList.contains("active")
})

console.log(currentStep);


if (currentStep < 0) {
    currentStep = 0
    showCurrentStep()

}

multiStepForm.addEventListener("click", e => {
    if (e.target.matches("[data-next]")) {
        currentStep += 1
    } else if (e.target.matches("[data-previous]")) {
        currentStep -= 1
    }
    console.log("Pre",currentStep)
    showCurrentStep()
})

function showCurrentStep() {
    formSteps.forEach((step, index) => {
        if (index === currentStep) {
            step.classList.toggle("active", index == currentStep)
            step.classList.remove("hidden", index == currentStep)
        } else {
            step.classList.add("hidden", index == currentStep)

        }


        console.log("Index : ", index)
        console.log("Current Step", currentStep)
    })
}



