({
    doReloadFilteredProducts: function (cmp, evt) {
        var textToSearch = cmp.find('product-search-text-input').get('v.value');
        var selectedFilters = cmp.get('v.selectedFilters');

        var filteredProducts = cmp.get("c.getFilteredProducts");
        filteredProducts.setParams({
            "textToSearch" : textToSearch,
            "selectedFilters" : selectedFilters
        });

        filteredProducts.setCallback(this, function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                cmp.set("v.filteredProducts", response.getReturnValue());
            } else if (state === "ERROR") {
                alert('Error : ' + JSON.stringify(response.getError()));
            }
        });

        $A.enqueueAction(filteredProducts);
    }
});