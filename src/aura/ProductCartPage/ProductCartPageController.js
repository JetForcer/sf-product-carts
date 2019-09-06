({
    reloadCartItems: function (cmp, evt, helper) {
        helper.doReloadCartItems(cmp, evt)
    },

    removeFromCart: function (cmp, evt, helper) {
        var product2Id = evt.getParam('row').product2Id;
        var opportunityId = cmp.get('v.recordId');

        var removeItemAction = cmp.get("c.removeCartItem");
        removeItemAction.setParams({
            "product2Id": product2Id,
            "opportunityId": opportunityId
        });

        removeItemAction.setCallback(this, function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                helper.doReloadCartItems(cmp, evt);
            } else if (state === "ERROR") {
                alert('Error : ' + JSON.stringify(response.getError()));
            }
        });

        $A.enqueueAction(removeItemAction);
    }
});