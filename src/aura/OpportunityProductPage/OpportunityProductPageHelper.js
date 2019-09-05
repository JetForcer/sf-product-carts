({
    doReloadFilteredProducts: function (cmp, evt) {
        var textToSearch = cmp.find('product-search-text-input').get('v.value');
        var selectedFamilies = cmp.get('v.selectedFamilies');
        var opportunityId = cmp.get('v.recordId');

        var filteredProductsAction = cmp.get("c.getFilteredProducts");
        filteredProductsAction.setParams({
            "opportunityId": opportunityId,
            "textToSearch": textToSearch,
            "selectedFamilies": selectedFamilies
        });

        filteredProductsAction.setCallback(this, function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                cmp.set("v.filteredProducts", response.getReturnValue());
            } else if (state === "ERROR") {
                alert('Error : ' + JSON.stringify(response.getError()));
            }
        });

        $A.enqueueAction(filteredProductsAction);
    }
});