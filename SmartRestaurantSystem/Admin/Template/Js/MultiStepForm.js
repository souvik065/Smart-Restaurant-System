

const multiStepForm = document.querySelector("[data-multi-step-form]")
const formSteps = [...multiStepForm.querySelectorAll("[data-step]")]
const step1 = document.getElementById('step1');
const step1ProgressLine = document.getElementById('step1ProgressLine');
const step2 = document.getElementById('step2');
const step2ProgressLine = document.getElementById('step2ProgressLine');
const step3 = document.getElementById('step3');
const step3ProgressLine = document.getElementById('step3ProgressLine');
const finished = document.getElementById('finished');

let currentStep = formSteps.findIndex(step => {
    return step.classList.contains("active");
})




if (currentStep < 0) {
    debugger;
    currentStep = 0
    showCurrentStep()

}






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

    if (currentStep == 3) {
        finished.classList.add("progress-done");
    } else {
        finished.classList.remove("progress-done");

    }


}

function showCurrentStep() {
    debugger;
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




