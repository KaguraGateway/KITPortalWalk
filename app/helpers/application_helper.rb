module ApplicationHelper
    def react_component(component, props = {})
        tag.div id: "react-root", data: { react_component: component, react_props: props.to_json }
    end
end
