(function () {
    const App = window.App || (window.App = {});

    function applySelect2(el) {
        const url = el.data('url');
        el.select2({
            placeholder: el.attr('placeholder'),
            allowClear: true,
            minimumInputLength: 3,
            quietMillis: 500,
            deplay: 500,
            language: "pt-BR",
            ajax: {
                url: url,
                dataType: 'json',
                quietMillis: 500,
                deplay: 500,
                data: function (term) {
                    var jsonParams = App.get_params_custom();
                    jsonParams.q = term;
                    const paramName = el.data('param-name');
                    const paramValue = el.data('param-value');

                    if (paramName && paramValue) jsonParams[paramName] = paramValue;

                    return jsonParams;
                },

                results: function (data, page) { // parse the results into the format expected by Select2.
                    // since we are using custom formatting functions we do not need to alter the remote JSON data
                    return {results: data};
                },
            },
            initSelection: function (element, callback) {
                const key = $(element).val();
                if (key === '') return;

                $.ajax(url + '?key=' + key, {dataType: 'json'}).done(function (data) {
                    callback(data);
                });
            },
        });
    }

    App.get_params_custom = () => {
        return {}
    };

    App.select2ajaxFull = (function (els) {

        if (!els) return;
        els.each(function () {
            applySelect2($(this));
        });
    });

}).call(this);
