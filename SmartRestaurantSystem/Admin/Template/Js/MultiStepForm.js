

const multiStepForm = document.querySelector("[data-multi-step]")
const formSteps = [...multiStepForm.querySelectorAll("[data-step]")]
const step1 = document.getElementById('step1');
const step1ProgressLine = document.getElementById('step1ProgressLine');
const step2 = document.getElementById('step2');
const step2ProgressLine = document.getElementById('step2ProgressLine');
const step3 = document.getElementById('step3');
const step3ProgressLine = document.getElementById('step3ProgressLine');

let currentStep = formSteps.findIndex(step => {
    return step.classList.contains("active");
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

function FillProgressLine() {
    if (currentStep > 0) {
        step1.classList.add("progress-done");
        step1ProgressLine.classList.add("progress-line")

    } else {
        step1.classList.remove("progress-done");
        step1ProgressLine.classList.remove("progress-line")
    }

    if (currentStep > 1) {
        step2.classList.add("progress-done");
        step2ProgressLine.classList.add("progress-line")

    } else {
        step2.classList.remove("progress-done");
        step2ProgressLine.classList.remove("progress-line")
    }

    if (currentStep > 2) {
        step3.classList.add("progress-done");
        step3ProgressLine.classList.add("progress-line")

    } else {
        step3.classList.remove("progress-done");
        step3ProgressLine.classList.remove("progress-line")
    }
}

function showCurrentStep() {
    formSteps.forEach((step, index) => {
        if (index === currentStep) {
            step.classList.toggle("active", index == currentStep)
            step.classList.remove("hidden", index == currentStep)
        } else {
            step.classList.add("hidden", index == currentStep)

        }
        FillProgressLine();

        console.log("Index : ", index)
        console.log("Current Step", currentStep)
    })
}



