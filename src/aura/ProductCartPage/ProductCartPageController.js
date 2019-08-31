({
    doInit: function (cmp, evt) {
        var getProductFilters = cmp.get("c.getProductFilters");

        getProductFilters.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                cmp.set("v.filters", response.getReturnValue());
            } else if (state === "ERROR") {
                alert('Error : ' + JSON.stringify(response.getError()));
            }
        });

        $A.enqueueAction(getProductFilters);
    },

    handleOnKeyup: function (cmp, evt) {
        var enterKey = evt.code === "Enter";
        if (enterKey) {
            var queryTerm = cmp.find('product-inline-search-input').get('v.value');
            alert('Searched for "' + queryTerm + '"!');
        }
    },

    handleFiltersChange: function (component, event) {
        alert(event.getParam('value'));
    }
})