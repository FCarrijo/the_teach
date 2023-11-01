// $(document).on('turbolinks:before-cache', function () {
//     var tables = $.fn.dataTable.fnTables(true);
//
//     $(tables).each(function () {
//         $(this).dataTable().fnDestroy();
//     });
//
//     $.fn.dataTable.ext.errMode = function (settings, helpPage, message) {
//         console.error(message);
//     };
// });

// $(document).on('nested:fieldAdded', function (el) {
//     App.reload();
// });
// $(document).on('cocoon:after-insert', function (el) {
//     App.reload();
// });

$(document).on('turbolinks:load', function () {

    const App = window.App || (window.App = {});
    const Document = window.Document || (window.Document = {});

    App.init = () => {
        try {
            /* Adicionar pesquisa no menu */
            App.searchMenu();
        } catch (e) {
            console.warn("Erro ao implementar a pesquida do menu");
            console.log(e);
        }
        try {
            /* Adicionar pesquisa no modulos */
            App.searchModule();
        } catch (e) {
            console.warn("Erro ao implementar a pesquida do modulos");
            console.log(e);
        }

        try {

            Notification.requestPermission().then(function (result) {
                if (result.permission === 'denied') {
                    // Ação caso negue
                }
            });
        } catch (e) {
            console.warn("Erro ao requisitar notificação");
        }

        try {
            App.configNotificationDatatable();
        } catch (e) {
            console.warn("Erro ao configurar notificação");
        }

        try {
            $.fn.donetyping = function (callback) {
                var _this = $(this);
                var x_timer;
                _this.keyup(function () {
                    clearTimeout(x_timer);
                    x_timer = setTimeout(clear_timer, 1000);
                });

                function clear_timer() {
                    clearTimeout(x_timer);
                    callback.call(_this);
                }
            }
        } catch (e) {
            console.warn("Erro ao adicionar event donetyping");
            console.log(e);
        }


        try {
            /* Adicionar comportamento de abertura do menu */
            App.setNavigation();
        } catch (e) {
            console.warn("Inicializar menu de navegação");
            console.log(e);
        }

        try {
            /* Recarrega configurações (máscaras, componentes, tooltips, etc.) */
            App.reload();
        } catch (e) {
            console.warn("Erro ao recarregar dados de configuração");
            console.log(e);
        }

        /* Ação para seleção do órgão */
        try {
            $(".select-orgao").on("change.select2", function (e) {
                $(e.target).closest("form").submit();
            });
        } catch (e) {
            console.warn("Erro ao configurar campo de seleção de órgão");
            console.log(e);
        }
        /* Ação para seleção do órgão */
        try {
            App.initDocDados();
        } catch (e) {
            console.warn("Erro ao configurar campo de seleção de órgão");
            console.log(e);
        }

        /* Ação para seleção do órgão */
        try {
            App.function_system();
        } catch (e) {
            console.warn("Erro ao carregar");
            console.log(e);
        }
        // $.fakeLoader({spinner: 'spinner7', bgColor: '#34495e'});
        $('.circ1').text('S');
        $('.circ2').text('I');
        $('.circ3').text('E');
        $('.circ4').text('D');
        $('.spinner7').append('<div class="circ5">O</div>');
        $('.spinner7').append('<div class="circ6">S</div>');

        try {
            /* Adicionar pesquisa no menu */
            App.set_check_box();
        } catch (e) {
            console.warn("Erro ao implementar o check box");
            console.log(e);
        }

        $('.input_arquivo_storage').change(function () {
            var obj = $(this), file = obj.val().split("\\")[obj.val().split("\\").length - 1];
            obj.closest('label').find('p').html(file);
        });

        /* Ação para seleção do ordem funcional*/
        try {
            App.set_ordem_funcional_id();
        } catch (e) {
            console.warn("Erro ao setar ordem funcional ID");
            console.log(e);
        }

        // inicializa_action_cable();
    }

    App.reload = () => {
        // console.log("App.reload");
        $('[data-toggle="popover"]').popover({html: true, trigger: "hover"});
        $('[data-toggle="popover-click"]').popover({html: true});
        // $('.anomes-mask').mask('00/0000', {reverse: false});

        $('.input_arquivo_storage').change(function () {
            var obj = $(this), file = obj.val().split("\\")[obj.val().split("\\").length - 1];
            obj.closest('label').find('p').html(file);
        });

        $('.btn-add-dig').data("association-insertion-node", function (link) {
            return link.closest('.fallback').find('#dig-docs')
        });
        //
        // try {
        //     App.select2ajaxMultiple($('.select2ajaxMultiple'));
        // } catch (e) {
        //     console.warn("Erro inicializar o select 2 multiple");
        //     console.log(e);
        // }

        // $('.chosen-select').chosen({width: "100%"});

        try {
            App.configSelect2();
        } catch (e) {
            console.warn("Erro inicializar o select2 ajax e simples");
            console.log(e);
        }

        try {
            /* Adicionar tooltip */
            $('body').tooltip({
                selector: "[data-title]",
                container: "body"
            });
        } catch (e) {
            console.warn("Erro inicializar ao inicializar tooltip");
            console.log(e);
        }



        try {
            /* Adicionar o campo classe de required */
            $("input[required]").parent().children(".control-label").addClass("required");
        } catch (e) {
            console.warn("Erro ao configurar required");
            console.log(e);
        }


        try {
            App.configDatepicker();
        } catch (e) {
            console.warn("Erro ao configurar datapicker e refanomes");
            console.log(e);
        }

        try {
            App.select2ajaxFull($('.select2ajaxFull'));
        } catch (e) {
            console.warn("Erro ao configurar select 2");
            console.log(e);
        }

        try {
            App.get_hour();
        } catch (e) {
            console.warn("Erro ao implementar o check box");
            console.log(e);
        }

        try {
            $('.input_moeda').each(function () {
                var inputMoney = $(this);

                inputMoney.maskMoney({
                    precision: inputMoney.data('precision') || 2,
                    allowZero: true,
                    allowNegative: inputMoney.data('allowNegative') || true,
                    decimal: ',',
                    thousands: '.'
                }).maskMoney('mask', inputMoney.val());
            });
        } catch (e) {
            console.warn("Erro ao inicializar componente maskMoney");
            console.log(e);
        }

        // try {
        //     $('.input-money').each(function () {
        //         var inputMoney = $(this);
        //
        //         inputMoney.maskMoney({
        //             precision: inputMoney.data('precision') || 2,
        //             allowNegative: inputMoney.data('allowNegative') || true,
        //             allowZero: inputMoney.data('allowZero') || true,
        //             decimal: inputMoney.data('decimal') || ',',
        //             thousands: inputMoney.data('thousands') || '.',
        //         }).maskMoney('mask', inputMoney.val());
        //     });
        // } catch (e) {
        //     console.warn("Erro ao inicializar componente maskMoney");
        //     console.log(e);
        // }

        // try {
        //     App.configCertificadoDialog();
        // } catch (e) {
        //     console.warn("Erro ao inicializar componente de certificados eSocial");
        //     console.log(e);
        // }

    };

    // App.configUnmask = () => {
    //     $("form.clear-masks").submit(function () {
    //
    //         $(this).find(".unmask-submit").unmask();
    //
    //         $(this).find(".money").unmask();
    //         $(this).find(".money").mask('000000000000000.00', {reverse: true});
    //
    //     });
    // };

    // App.setMasks = () => {
    //     // Masks
    //     $(".negative-number").mask("Z0.9999990", {
    //
    //         translation: {
    //             '0': {pattern: /\d/},
    //             '9': {pattern: /\d/, optional: true},
    //             'Z': {pattern: /[\-\+]/, optional: true}
    //         }
    //     });
    //          $(".ano").mask('0000');
    //     $('.cpf').mask('000.000.000-00');
    //     $('.nmr-processo').mask('9999999-99.9999.9.99.9999');
    //     $(".nis").mask("999.99999.99-9");
    //     $(".cnpj").mask("99.999.999/9999-99");
    //     $('.money').mask('000.000.000.000.000,00', {reverse: true});
    //     $('.hour').mask('00:00');
    //     $('.cep').mask('00000-000');
    //     $('.pis').mask('000.00000.00-0');
    //     $('.telefone').mask('(00) 0000-00009');
    //     $('.data-format').mask('00/00/0000', {reverse: false});
    //     $('.nmr_sei, .nmr-sei').mask('00.0.000000000-0', {reverse: false});
    //     $('.number-pct').mask('00.00', {reverse: false});
    //     $('.number-1').mask('0', {reverse: false});
    //     $('.number-4').mask('0000', {reverse: false});
    //     $('.number-5').mask('00000', {reverse: false});
    //     $('.number-6').mask('000000', {reverse: false});
    //     $('.number-8').mask('00000000', {reverse: false});
    //     $('.number-11').mask('00000000000', {reverse: false});
    //     $('.number-15').mask('000000000000000', {reverse: false});
    //     $('.input-decimal').mask("###0.00", {reverse: true});
    //     $('.input-decimal-4').mask("###0.0000", {reverse: true});
    //     $('.input-decimal-1').mask("###0.0", {reverse: true});
    // };

    App.searchMenu = () => {
        $("#menu-search").on("keyup", function (e) {
            var filter = $(this).val().toUpperCase().normalize('NFD').replace(/[\u0300-\u036f]/g, "");
            $('.li_menu').each(function (i) {
                var menu = $(this);

                if (filter.length >= 3) {
                    if (menu.text().trim().toUpperCase().normalize('NFD').replace(/[\u0300-\u036f]/g, "").includes(filter)) {
                        menu.removeClass('hidden');
                    } else {
                        menu.addClass('hidden');
                    }
                } else {
                    menu.removeClass('hidden');
                }

            });
        });
    }

    App.searchModule = () => {
        $("#field-module-search").on("keyup", function (e) {
            var filter = $(this).val().toUpperCase().normalize('NFD').replace(/[\u0300-\u036f]/g, "");
            $('.div_modulo').each(function (i) {
                var menu = $(this);

                if (filter.length >= 3) {
                    if (menu.text().trim().toUpperCase().normalize('NFD').replace(/[\u0300-\u036f]/g, "").includes(filter)) {
                        menu.removeClass('hidden');
                    } else {
                        menu.addClass('hidden');
                    }
                } else {
                    menu.removeClass('hidden');
                }

            });
        });
    }


    App.setNavigation = () => {

        var path = window.location.pathname;
        path = path[0] == '/' ? path.substr(1) : path; //it will remove the dash in the URL

        $("ul.metismenu a").each(function () {
            var href = $(this).attr('href');
            href = href[0] == '/' ? href.substr(1) : href;
            if (path.substring(0, href.length) === href) {
                $(this).closest('li').addClass('active');
            }
        });

        $("ul.metismenu .nav-second-level a").each(function () {
            var href = $(this).attr('href');
            href = href[0] == '/' ? href.substr(1) : href;
            if (path.substring(0, href.length) === href) {
                $(this).parent().parent().closest('li').addClass('active');
                $(this).closest('ul').addClass('in');
            }
        });
    }

    App.configNotificationDatatable = () => {
        $('#notification-datatable.notification-datatable').each(function () {
            var _table = $(this);


            if (!$.fn.dataTable.isDataTable($(_table))) {

                const _source = $(_table).data('source');

                var dt = $(_table).dataTable({
                    processing: true,
                    serverSide: true,
                    stateSave: true,
                    ordering: false,
                    columns: [{"data": "message"}],
                    ajax: {
                        url: _source,
                        type: 'POST',
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.error(errorThrown);
                        }
                    },
                    info: false,
                    responsive: true,
                    paging: true,
                    lengthChange: false,
                    searching: false,
                    pagingType: "simple",
                    dom: 't<"bottom text-center"p>',
                    language: {
                        "decimal": "",
                        "emptyTable": "Nenhum registro encontrado",
                        "info": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
                        "infoEmpty": "Mostrando 0 até 0 de 0 registros",
                        "infoFiltered": "(Filtrados de _MAX_ registros)",
                        "infoPostFix": "",
                        "thousands": ".",
                        "lengthMenu": "Mostrar _MENU_ Registros",
                        "loadingRecords": "carregando...",
                        "processing": '<i class="fa fa-spinner fa-spin fa-3x fa-fw"></i><span class="sr-only">Carregando...</span> ',
                        "zeroRecords": "Nenhum registro encontrado",
                        "paginate": {
                            "first": "Primeiro",
                            "last": "Último",
                            "next": "Próximo",
                            "previous": "Anterior"
                        },
                        "aria": {
                            "sortAscending": ": Ordenar colunas de forma ascendente",
                            "sortDescending": ": Ordenar colunas de forma descendente"
                        },
                        "buttons": {
                            "copySuccess": {
                                1: "Copiada uma linha para área de transferência",
                                _: "Copiadas %d linhas para área de transferência"
                            },
                            "copyTitle": 'Copiar para área de transferência',
                            "copyKeys": 'Pressione <i>ctrl</i> ou <i>\u2318</i> + <i>C</i> para copiar os dados da tabela <br/>para sua área de transferência.<br/><br/>Para cancelar, click nessa mensagem ou pressiona esc.'
                        }
                    }
                }).on('draw.dt', function (e, settings) {
                    if (dt) {
                        var count = dt.api().rows().count();
                        var info = dt.api().page.info();

                        if (info.pages > 1 || count == 10) {
                            _table.data("count", "9+");
                        } else {
                            _table.data("count", dt.api().rows().count());
                        }

                        $(".right-sidebar-toggle .notify-count").remove();
                        $(".right-sidebar-toggle i").removeClass("bell ring");

                        if (count > 0) {
                            $(".right-sidebar-toggle").append('<span class="notify-count label label-primary">' + _table.data("count") + '</span>');
                            $(".right-sidebar-toggle i").addClass("bell ring");
                        }

                    }
                });

            }
        });
    }


    App.configUploadPreview = () => {
        $.uploadPreview({
            input_field: ".image-upload",   // Default: .image-upload
            preview_box: ".image-preview",  // Default: .image-preview
            label_field: ".image-label",    // Default: .image-label
            label_default: "Escolha o Arquivo",   // Default: Choose File
            label_selected: "Altere o Arquivo",  // Default: Change File
            no_label: false,                 // Default: false
            success_callback: function () {
                $(".image-saved").hide();
            }
        });
    }


    App.doc_open_button = () => {
        $(".doc-open-button").on("click", function (event) {
            if ($(event.target).attr("doc")) {
                _doc = $('#' + $(event.target).attr("doc"));
                _doc.modal();
            } else {
                $(".modal-doc-dados").first().modal();
            }
        });
    }

    App.select2Params = (form_id) => {
        $form = $('#' + form_id);
        // var formdata = JSON.stringify(form_array_serialize);
        var form_params = $form.find('.parametro_select2');
        var result = {};
        $.map(form_params, function (n, i) {
            var selectName = document.getElementsByName(n.name);
            if (selectName.length > 0) {
                var name = n['name'].split('[').slice(-1).join(' ').replace(']', '');
                if ($(n).prop('type') == 'select-multiple') {
                    result[name] = $(n).children("option:selected").map(function (i, el) {
                        return $(el).val();
                    }).get();
                } else {
                    result[name] = n['value'];
                }
                // result[name] = selectName[0].value;
            }
        });
        return result;
    };

    App.configSelect2 = () => {
        // Select2 Ajax
        $('.select2ajax').each(function () {
            if ($(this).data("select2") === undefined) {
                App.applySelect2($(this));
            }
        });

        // Select2 initialization
        $('.select2').each(function () {
            if ($(this).data("select2") === undefined) {
                /* Ação para seleção do órgão */
                try {
                    $(this).select2({
                        placeholder: 'Digite para Pesquisar',
                        language: "pt-BR"
                    });
                } catch (e) {
                    console.warn("Erro ao carregar select2");
                    console.log(e);
                }
            }
        });
    }

    //
    App.select2ajaxFull($('.select2ajaxFull'));


    // método para adicionar select2 com ajax
    App.applySelect2 = (el) => {
        const url = el.data('url');
        const form_id = el.data('formId') || el.closest('form').attr("id");
        var multiple = el.attr('multiple');
        var minimumInput = el.data('minimumInput');
        var preload = el.data('preload');

        if (minimumInput) {
            minimumInput = 2;
        } else if (minimumInput < 1) {
            minimumInput = 1;
        }

        if (preload) {
            minimumInput = 0;
        }

        var _select2 = el.select2({
            placeholder: el.attr('placeholder'),
            allowClear: true,
            minimumInputLength: minimumInput,
            quietMillis: 500,
            deplay: 500,
            multiple: multiple,
            ajax: {
                url: url,
                dataType: 'json',
                quietMillis: 500,
                deplay: 500,
                data(term) {
                    var jsonParams = App.select2Params(form_id) || {};
                    jsonParams.q = term;
                    const paramName = el.data('param-name');
                    const paramValue = el.data('param-value');

                    if (paramName != null && paramValue != null) jsonParams[paramName] = paramValue;

                    return jsonParams;
                },
                results(data) {

                    const _results = [];
                    const _id_name = el.attr('id_name') || 'id';
                    const _text_name = el.attr('text_name') || 'text';

                    $(data).each(function () {
                        _results.push({id: this[_id_name], text: this[_text_name]})
                    });

                    return {results: _results};
                },
            },
            initSelection(element, callback) {
                const id = $(element).val();
                if (id === '') return;

                $.ajax(`${url}?key=${id}`, {
                    dataType: 'json',
                    data: App.select2Params(form_id)
                })
                    .done((data) => {

                        const _id_name = el.attr('id_name') || 'id';
                        const _text_name = el.attr('text_name') || 'text';

                        if (data == null) {
                            callback({id: '', text: ''});
                        } else if (data.constructor === Array) {
                            if (data.length > 0) {
                                callback({id: data[0][_id_name], text: data[0][_text_name]});
                            } else {
                                callback({id: '', text: ''});
                            }
                        } else {
                            callback({id: data[_id_name], text: data[_text_name]});
                        }

                    });
            },
        });

        return _select2;
    }

    App.configBootstrapDualListbox = () => {
        $(".dual_select_br").bootstrapDualListbox({
            selectorMinimalHeight: 320,
            filterTextClear: 'Mostrar todos',
            filterPlaceHolder: 'Filtro',
            moveSelectedLabel: 'Mover selecionado',
            moveAllLabel: 'Mover todos',
            removeSelectedLabel: 'Remover selecionado',
            removeAllLabel: 'Remover todos',
            infoText: 'Mostrando todos {0}',                                                     // text when all options are visible / false for no info text
            infoTextFiltered: '<span class="label label-warning">Filtrado</span> {0} de {1}',   // when not all of the options are visible due to the filter
            infoTextEmpty: 'Lista vazia'                                                        // when there are no options present in the list
        });

        $(".predio_uni_br").bootstrapDualListbox({
            selectorMinimalHeight: 320,
            filterPlaceHolder: 'Filtrar unidades'
        });
    }

    App.configDatepicker = () => {
        // Inicializar Datepicker
        try {
            $('.date-picker').each(function () {
                var date_picker = $(this);
                date_picker.datepicker({
                    autoclose: true,
                    clearBtn: true,
                    language: 'pt-BR',
                    format: 'dd/mm/yyyy',
                    orientation: date_picker.data('orientation') || 'auto',
                    todayBtn: 'linked'
                }).keyup(function (e) {
                    // Limpa data quando é deleta a data informada
                    if ((e.keyCode == 8 || e.keyCode || 9 || e.keyCode == 46) && ($(this).val() === "__/__/____")) {
                        $(this).datepicker('setDate', null);
                    }
                });
            });
        } catch (e) {
            console.warn("Erro ao inicializar componente date picker");
            console.log(e);
        }
    }


    App.initDocDados = () => {
        App.reload_nested();
        App.reload();
    }


    App.reload_nested = () => {
        // console.log("App.reload_nested");
        $(".cocoon-group").off();
        $(".cocoon-group").on('cocoon:after-insert', () => {
            App.reload();
        });

        /* Reload em cocoon */
        $(".tab-pane-document").each(function (index) {
            Document.documents($(this).parent(), $(this));
        });
        /* Adiciona o comportamento do cocoon dos nested */
        $(".cocoon-doc-dados").on('cocoon:after-insert', (event, insertedItem, originalEvent) => {
            Document.documents(event.target, insertedItem);
        });

        $(".cocoon-doc-dados").on('cocoon:after-remove', (event, removedItem, originalEvent) => {

            if (removedItem.hasClass("tab-pane-document")) {

                var _tab = $("#" + removedItem.attr("id") + "_aba");
                var _parent = _tab.parent();
                _tab.siblings().last().children().tab("show");
                _tab.remove();


                $.each(_parent.find("a"), function (index, value) {
                    $(value).html(index + 1);
                });

            }

        });
    }


    App.function_system = () => {
        cpf_or_cnpj = (value) => {
            if (value == 'cpf') {
                $("#cpf_cnpj").removeClass("cnpj").addClass("cpf")
                $("#cpf_cnpj").val($("#cpf_cnpj_hidden").val());
                $('#cpf_cnpj').mask('000.000.000-00');

            } else {
                $("#cpf_cnpj").removeClass("cpf").addClass("cnpj")
                $("#cpf_cnpj").val($("#cpf_cnpj_hidden").val());
                $("#cpf_cnpj").mask("99.999.999/9999-99");
            }
        }

    }

    App.set_check_box = () => {
        $('.tree').on("click", "i", function (e) {
            $(this).next('input').next('label').next('ul').slideToggle();
            if ($(this).hasClass('fa fa-plus'))
                $(this).removeClass('fa fa-plus').addClass('fa fa-minus');
            else
                $(this).removeClass('fa fa-minus').addClass('fa fa-plus');
            $(this).find('child').animate({height: 'toggle'});
            e.stopPropagation();
        });

        $('.tree').on("change", "input[type=checkbox]", function (e) {
            var brother = $(this).closest('ul').children('li').children("input[type='checkbox']:checked");
            var father = $(this).closest('ul').parent('li').parent('ul').children('li').children("input[type='checkbox']:checked");
            if (!brother.is(':checked') && brother.length === 0) {
                $(this).parents().eq(2).children("input[type='checkbox']").prop('checked', false);
            } else {
                $(this).parents().eq(2).children("input[type='checkbox']").prop('checked', true);
            }
            if (!father.is(':checked')) {
                $(this).parentsUntil('.tree').children("input[type='checkbox']").prop('checked', this.checked);
            }
            $(this).siblings('ul').find("input[type='checkbox']").prop('checked', this.checked);
            e.stopPropagation();
        });

        $('button').on("click", function (e) {
            switch ($(this).text()) {
                case 'Fechar todos':
                    $('.tree ul').fadeOut();
                    $('.tree i').removeClass('fa fa-minus').addClass('fa fa-plus');
                    e.preventDefault();
                    break;
                case 'Abrir Todos':
                    $('.tree ul').fadeIn();
                    $('.tree i').removeClass('fa fa-plus').addClass('fa fa-minus');
                    e.preventDefault();
                    break;
                case 'Marcar Todos':
                    $(".tree input[type='checkbox']").prop('checked', true);
                    e.preventDefault();
                    break;
                case 'Desmarcar':
                    $(".tree input[type='checkbox']").prop('checked', false);
                    e.preventDefault();
                    break;
                default:
            }
        });

        $('.tree-simple').on("click", "i", function (e) {
            $(this).next('label').next('ul').slideToggle();
            if ($(this).hasClass('fa fa-plus'))
                $(this).removeClass('fa fa-plus').addClass('fa fa-minus');
            else
                $(this).removeClass('fa fa-minus').addClass('fa fa-plus');
            $(this).find('child').animate({height: 'toggle'});
            e.stopPropagation();
        });

        $('.button-tree-simple-collapse').on("click", function (e) {
            $(e.target.parentElement.nextElementSibling).find('.tree-simple ul').each(function (index, element) {
                $(element).fadeOut();
            });
            $(e.target.parentElement.nextElementSibling).find('.tree-simple i').each(function (index, element) {
                $(element).removeClass('fa fa-minus').addClass('fa fa-plus');
            });
            e.preventDefault();
        });

        $('.button-tree-simple-expand').on("click", function (e) {
            $(e.target.parentElement.nextElementSibling).find('.tree-simple ul').each(function (index, element) {
                $(element).fadeIn();
            });
            $(e.target.parentElement.nextElementSibling).find('.tree-simple i').each(function (index, element) {
                $(element).removeClass('fa fa-plus').addClass('fa fa-minus');
            });
            e.preventDefault();
        });
    }

    App.create_UUID = () => {
        var dt = new Date().getTime();
        var uuid = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
            var r = (dt + Math.random() * 16) % 16 | 0;
            dt = Math.floor(dt / 16);
            return (c == 'x' ? r : (r & 0x3 | 0x8)).toString(16);
        });
        return uuid;
    }

    App.showCertDialog = (url, icon) => {
        let _id_certificado = App.create_UUID();
        let _id_token = App.create_UUID();
        var _error_text = "";

        if (icon == 'error') {
            _error_text = '<div class="text-danger" style="display: block; font-size: 14px;">Token inválido!</div>';
        } else if (icon == 'unauthorized') {
            _error_text = '<div class="text-danger" style="display: block; font-size: 14px;">Usuário não possui permissão para este certificado!</div>';
        }

        return swal({
            title: 'Certificado e Token de Acesso',
            icon: icon,
            html:
                _error_text +
                '<div class="form-group" style="margin-top: 10px;">' +
                '<label class="control-label">Certificado</label>' +
                '<input id="' + _id_certificado + '" required="true" class="swal2-input" style="padding: 0; margin-top: 0px;" />' +
                '</div>' +
                '<div class="form-group">' +
                '<label class="control-label">Senha</label>' +
                '<input type="password" id="' + _id_token + '" required="true" class="swal2-input" autocomplete="new-password" style="margin-top: 0px;"/>' +
                '</div>',
            focusConfirm: false,
            showCancelButton: true,
            onOpen: () => {
                $.ajax({
                    type: 'GET',
                    url: url,
                    success: function (data) {
                        $("#" + _id_certificado).select2({data: data});
                    }
                });
            }
        }).then((data) => {
            // $("#id_certificado").val(document.getElementById(_id_certificado).value);
            // $("#id_token").val(document.getElementById(_id_token).value);
            return [
                document.getElementById(_id_certificado).value,
                document.getElementById(_id_token).value
            ]

        });
    }

    App.verificarCert = async (e, params, icon, onsuccess) => {
        var localParams = params || {};


        if (!localParams.send) {
            e.preventDefault();

            const tagName = e.target.tagName;
            const element = tagName == 'BUTTON' || tagName == 'FORM' ? $(e.target) : $(e.target).parent();

            let url_certs = $(element).data("urlCert");
            let url_validate = $(element).data("urlValidate");

            var formValues = await App.showCertDialog(url_certs, icon);
            // var formValues = [ $("#id_certificado").val(), $("#id_token").val()];
            if (formValues) {
                $.ajax({
                    type: 'POST',
                    url: url_validate,
                    data: {"value": formValues},
                    success: function (data) {
                        if (data && data.result == "fail") {
                            App.verificarCert(e, params, 'error', onsuccess);
                        } else if (data && data.result == 'unauthorized') {
                            App.verificarCert(e, params, 'unauthorized', onsuccess);
                        } else {
                            onsuccess(formValues[0], formValues[1]);
                        }
                    }
                });
            }
        }
    }

    App.configButtonCertificadoDialog = () => {
        $(".btn-certificate-check").on("click", (e, params) => {
            const button = e.target.tagName == 'BUTTON' ? $(e.target) : $(e.target).parent();

            const url = button.data('path')

            App.verificarCert(e, params, 'question', (cert, token) => {
                if (url) {
                    $.ajax({
                        url: url,
                        data: {cert: cert, token: token}
                    });
                }
            });
        });
    }

    App.configCertificadoDialog = () => {

        $(".form-certificate-check").on("submit", function (e, params) {
            App.verificarCert(e, params, 'question', (cert, token) => {

                var input_cert = $("<input>").attr("type", "hidden").attr("name", "certificado").val(cert);
                var input_token = $("<input>").attr("type", "hidden").attr("name", "token").val(token);
                $(e.target).append(input_cert);
                $(e.target).append(input_token);
                $(e.currentTarget).trigger(e.type, {'send': true});

            });
        });

        $(".btn-certificate-check").on("click", (e, params) => {
            const button = e.target.tagName == 'button' ? $(e.target) : $(e.target).parent();
            const url = button.data('path')
            verificarCert(e, params, 'question', (cert, token) => {
                if (url) {
                    console.log("Aqui também");
                    $.ajax({
                        url: url,
                        data: {cert: cert, token: token}
                    });
                }
            });
        });

    }

    App.get_hour = () => {
        $(".form-horario").on("input", function () {
            var get_id = $(this).attr('name').split("[");
            if (get_id[0] === "frequencia_tbhorario") {
                get_id = $(this).attr('name').split("][");
                var valor_ini_intervalo = $("#frequencia_tbhorario_frequencia_tb_itens_horario_attributes_" + get_id[1] + "_hora_ini_intervalo").val();
                var valor_intervalo = $("#frequencia_tbhorario_frequencia_tb_itens_horario_attributes_" + get_id[1] + "_intervalo").val();
                var valor_fim_intervalo;
                var split = valor_ini_intervalo.split(":");
                if (valor_intervalo === 'sem_intervalo') {
                    $("#frequencia_tbhorario_frequencia_tb_itens_horario_attributes_" + get_id[1] + "_hora_fim_intervalo").val("00:00");
                    $("#frequencia_tbhorario_frequencia_tb_itens_horario_attributes_" + get_id[1] + "_hora_ini_intervalo").val("00:00").prop("readonly", true);
                } else {
                    $("#frequencia_tbhorario_frequencia_tb_itens_horario_attributes_" + get_id[1] + "_hora_ini_intervalo").prop("readonly", false);

                    if (valor_ini_intervalo.length === 5) {
                        if (valor_intervalo === 'uma_hora') {
                            valor_intervalo = 1;
                        } else if (valor_intervalo === 'duas_horas') {
                            valor_intervalo = 2;
                        } else {
                            valor_intervalo = 0;
                        }
                        valor_fim_intervalo = parseInt(split[0]) + valor_intervalo;
                        if (valor_fim_intervalo < 10) {
                            var aux = "0";
                            valor_fim_intervalo = aux.concat(valor_fim_intervalo.toString());
                        }
                        var final = valor_fim_intervalo.toString().concat(":").concat(split[1]);
                        $("#frequencia_tbhorario_frequencia_tb_itens_horario_attributes_" + get_id[1] + "_hora_fim_intervalo").val(final);
                    }
                }
            } else {
                var valor_ini_intervalo = $("#frequencia_tb_itens_horario_hora_ini_intervalo").val();
                var valor_intervalo = $("#frequencia_tb_itens_horario_intervalo").val();
                var valor_fim_intervalo;
                var split = valor_ini_intervalo.split(":");
                if (valor_intervalo === 'sem_intervalo') {
                    $("#frequencia_tb_itens_horario_hora_fim_intervalo").val("00:00");
                    $("#frequencia_tb_itens_horario_hora_ini_intervalo").val("00:00").prop("readonly", true);
                } else {
                    $("#frequencia_tb_itens_horario_hora_ini_intervalo").prop("readonly", false);

                    if (valor_ini_intervalo.length === 5) {
                        if (valor_intervalo === 'uma_hora') {
                            valor_intervalo = 1;
                        } else if (valor_intervalo === 'duas_horas') {
                            valor_intervalo = 2;
                        } else {
                            valor_intervalo = 0;
                        }
                        valor_fim_intervalo = parseInt(split[0]) + valor_intervalo;
                        if (valor_fim_intervalo < 10) {
                            var aux = "0";
                            valor_fim_intervalo = aux.concat(valor_fim_intervalo.toString());
                        }
                        var final = valor_fim_intervalo.toString().concat(":").concat(split[1]);
                        $("#frequencia_tb_itens_horario_hora_fim_intervalo").val(final);
                    }
                }
            }
        });
    }


    App.set_ordem_funcional_id = () => {
        $(".li_menu").on("click", (e, params) => {
            try {
                // e.preventDefault();
                // e.stopPropagation();

                if (e.target != null && e.target.href != null) {
                    var url = new URL(e.target.href);
                    var search_params = url.searchParams;

                    var g_ordem_funcional = localStorage.getItem('aba_' + getUniqueId());

                    if (g_ordem_funcional != null) {
                        search_params.set('g_ordem_funcional', g_ordem_funcional);
                        url.search = search_params.toString();
                    }

                    var dataType = 'html';
                    if (e.target.dataset.remote == "true") {
                        dataType = 'js';
                    }

                    $.ajax({
                        url: url.toString(),
                        dataType: dataType
                    });

                    e.target.href = url.toString();
                    // location.href = url.toString();

                }
            } catch (e) {
                console.warn("Erro ao implementar a pesquida do modulos");
                console.log(e);
            }
        });
    }


    // $('.prevent-enter-submit').bind("keypress", function(e) {
    //     if (e.keyCode == 13) {
    //         e.preventDefault();
    //         return false;
    //     }
    // });

    /* Iniciar */
    App.init();

}) //fim ;

function getAjax(url, data, success, error) {
    $.ajax({
        type: 'GET',
        url: url,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: data,
        success: success,
        before: null,
        error: error
    });
}

function postAjax(url, data, success, error) {
    $.ajax({
        type: 'POST',
        url: url,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: data,
        success: success,
        before: null,
        error: error
    });
}

function getUniqueId() {

    let value = window.sessionStorage.getItem('unique-id');

    if (!value || !window.name) {
        value = generateUuid();
        window.sessionStorage.setItem('unique-id', value);
    }

    window.name = value;
    return value;
}

function generateUuid() {
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
        let r = Math.random() * 16 | 0, v = c === 'x' ? r : ((r & 0x3) | 0x8);
        return v.toString(16);
    });
}

function setGetParams(el) {
    try {
        el.href = el.href + '?g_ordem_funcional=' + localStorage.getItem('aba_' + getUniqueId());
    } catch (e) {
        console.warn("Erro ao implementar a pesquida do modulos");
        console.log(e);
    }
}


function setCookie(cname, cvalue) {
    document.cookie = cname + "=" + cvalue;
}

function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) === ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) === 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

function isJSON(something) {
    if (typeof something != 'string')
        something = JSON.stringify(something);

    try {
        JSON.parse(something);
        return true;
    } catch (e) {
        return false;
    }
}

function carrrega_datatable_by_id(name_id) {
    $('#' + name_id).each(function () {
        var _table = $(this);
        var _exportOptions = {
            columns: [':visible thead th:not(.noExport)'],
            search: 'applied',
            order: 'applied'
        };

        _table.dataTable({
            paging: false,
            bLengthChange: false,
            dom: 'B<"pull-left"f><"pull-right"l>tip',
            language: {
                "decimal": "",
                "emptyTable": "Nenhum registro encontrado",
                "info": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
                "infoEmpty": "Mostrando 0 até 0 de 0 registros",
                "infoFiltered": "(Filtrados de _MAX_ registros)",
                "infoPostFix": "",
                "thousands": ".",
                "lengthMenu": "Mostrar _MENU_ Registros",
                "loadingRecords": "carregando...",
                "processing": "Processando...",
                "search": "Pesquisar:",
                "zeroRecords": "Nenhum registro encontrado",
                "paginate": {
                    "first": "Primeiro",
                    "last": "Último",
                    "next": "Próximo",
                    "previous": "Anterior"
                },
                "aria": {
                    "sortAscending": ": Ordenar colunas de forma ascendente",
                    "sortDescending": ": Ordenar colunas de forma descendente"
                },
                "buttons": {
                    "copySuccess": {
                        1: "Copiada uma linha para área de transferência",
                        _: "Copiadas %d linhas para área de transferência"
                    },
                    "copyTitle": 'Copiar para área de transferência',
                    "copyKeys": 'Pressione <i>ctrl</i> ou <i>\u2318</i> + <i>C</i> para copiar os dados da tabela <br/>para sua área de transferência.<br/><br/>Para cancelar, click nessa mensagem ou pressiona esc.'
                }
            },
            buttons: [
                {
                    extend: 'pdf',
                    title: _table.data('title-report'),
                    orientation: 'landscape',
                    exportOptions: _exportOptions
                },
                {
                    extend: 'excel',
                    title: _table.data('title-report'),
                    exportOptions: _exportOptions
                },
                {extend: 'csv'},
                {
                    extend: 'print',
                    text: 'Imprimir',
                    exportOptions: _exportOptions,
                    customize: function (win) {
                        $(win.document.body).addClass('white-bg');
                        $(win.document.body).css('font-size', '10px');
                        $(win.document.body).find('table')
                            .addClass('compact')
                            .css('font-size', 'inherit');
                    }
                }
            ],
            pageOrientation: 'landscape',
            orientation: 'landscape'
        });
    });
}
