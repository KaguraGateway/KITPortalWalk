// Entry point for the build script in your package.json
import "@hotwired/turbo-rails";

import React, { isValidElement, cloneElement } from "react";
import { createRoot } from "react-dom/client";
import { GraduationRequirementForm } from "./react/components/admin/GraduationRequirementForm"
const components: { [key: string]: React.FC<any> } = {
    "GraduationRequirementForm": GraduationRequirementForm
};
window.addEventListener("turbo:load", () => {
    const reactRootElem = document.getElementById("react-root");
    if (!reactRootElem)
        return;
    const componentName = reactRootElem.getAttribute("data-react-component");
    if (componentName == null || !components.hasOwnProperty(componentName))
        throw new Error(`Invalid component name: ${componentName}`);

    const component = components[componentName];
    const data = JSON.parse(reactRootElem.getAttribute("data-react-props") || "{}");
    const reactRoot = createRoot(reactRootElem);
    reactRoot.render(component(data));
});