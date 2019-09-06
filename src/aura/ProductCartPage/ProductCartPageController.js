({
    reloadCartItems: function (cmp, evt, helper) {
        helper.doReloadCartItems(cmp, evt)
    },

    handleCheckout: function (cmp, evt, helper) {
        var opportunityId = cmp.get('v.recordId');
        var cartItems = cmp.get('v.cartItems');

        var checkoutAction = cmp.get("c.checkoutCartItems");
        checkoutAction.setParams({
            "opportunityId": opportunityId,
            "cartItems": cartItems
        });

        checkoutAction.setCallback(this, function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                helper.doReloadCartItems(cmp, evt);
                helper.fireCartItemRemoval(opportunityId);
                $A.get("e.force:closeQuickAction").fire();
            } else if (state === "ERROR") {
                alert('Error : ' + JSON.stringify(response.getError()));
            }
        });

        $A.enqueueAction(checkoutAction);
    },

    removeFromCart: function (cmp, evt, helper) {
        var opportunityId = cmp.get('v.recordId');
        var product2Id = evt.getParam('row').product2Id;

        var removeItemAction = cmp.get("c.removeCartItem");
        removeItemAction.setParams({
            "product2Id": product2Id,
            "opportunityId": opportunityId
        });

        removeItemAction.setCallback(this, function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                helper.doReloadCartItems(cmp, evt);
                helper.fireCartItemRemoval(opportunityId)
            } else if (state === "ERROR") {
                alert('Error : ' + JSON.stringify(response.getError()));
            }
        });

        $A.enqueueAction(removeItemAction);
    }
});