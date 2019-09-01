({
    initCheckboxFilters: function (cmp, evt) {
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

    reloadFilteredProducts: function (cmp, evt) {
        var filteredProducts = cmp.get("c.getFilteredProducts");

        filteredProducts.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                cmp.set("v.filteredProducts", response.getReturnValue());
            } else if (state === "ERROR") {
                alert('Error : ' + JSON.stringify(response.getError()));
            }
        });

        $A.enqueueAction(filteredProducts);
    },

    handleSearchTextChange: function (cmp, evt) {
        var enterKey = evt.code === "Enter";
        if (enterKey) {
            var queryTerm = cmp.find('product-search-text-input').get('v.value');
            alert('Searched for "' + queryTerm + '"!');
        }
    },

    handleCheckboxFiltersChange: function (cmp, evt) {
        alert(evt.getParam('value'));
    }
});