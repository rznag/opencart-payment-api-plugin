{{ header }}{{ column_left }}
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-globee" data-toggle="tooltip" title="{{ button_save }}" class="btn btn-primary">
                    <i class="fa fa-save"></i>
                </button>
                <a href="{{ cancel }}" data-toggle="tooltip" title="{{ button_cancel }}" class="btn btn-default">
                    <i class="fa fa-reply"></i>
                </a>
            </div>
            <h1>{{ heading_title }}</h1>
            <ul class="breadcrumb">
                {% for breadcrumb in breadcrumbs %}
                    <li><a href="{{ breadcrumb.href }}">{{ breadcrumb.text }}</a></li>
                {% endfor %}
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        {% if error_warning %}
            <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> {{ error_warning }}
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
        {% endif %}
        {% if success %}
            <div class="alert alert-success"><i class="fa fa-check-circle"></i> {{ success }}
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
        {% endif %}
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> {{ label_edit }}</h3>
            </div>
            <div class="panel-body">
                <form action="{{ url_action }}" method="post" enctype="multipart/form-data" id="form-globee" class="form-horizontal">
                    <input type="hidden" name="action" value="save"/>
                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a href="#tab-settings" data-toggle="tab">{{ tab_settings }}</a>
                        </li>
                        <li>
                            <a href="#tab-log" data-toggle="tab">{{ tab_log }}</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab-settings">

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-status">{{ label_enabled }}</label>
                                <div class="col-sm-10">
                                    <select name="payment_globee_status" id="input-status" class="form-control">
                                        <option value="1" {% if value_enabled == 1 %} selected="selected" {% endif %}>{{ text_enabled }}</option>
                                        <option value="0" {% if value_enabled == 0 %} selected="selected" {% endif %}>{{ text_disabled }}</option>
                                    </select>
                                    {% if error_enabled %}
                                        <div class="text-danger">{{ error_enabled }}</div>
                                    {% endif %}
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-sort-order">{{ label_sort_order }}</label>
                                <div class="col-sm-10">
                                    <input type="number" name="payment_globee_sort_order" id="input-sort-order" value="{{ value_sort_order }}" class="form-control" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-network">{{ label_network }}</label>
                                <div class="col-sm-10">
                                    <select name="payment_globee_livenet" id="input-network" class="form-control">
                                        <option value="1" {% if value_livenet == 1 %} selected="selected" {% endif %}>{{ text_livenet }}</option>
                                        <option value="0" {% if value_livenet == 0 %} selected="selected" {% endif %}>{{ text_testnet }}</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-payment-api-key">{{ label_payment_api_key }}</label>
                                <div class="col-sm-10">
                                    <input type="text" name="payment_globee_payment_api_key" id="input-payment-api-key" value="{{ value_payment_api_key }}" class="form-control" />
                                    {% if error_payment_api_key %}
                                        <div class="text-danger">{{ error_payment_api_key }}</div>
                                    {% endif %}
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-risk-speed">{{ label_risk_speed }}</label>
                                <div class="col-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-bolt fa-fw"></i></span>
                                        <select name="payment_globee_risk_speed" id="input-risk-speed" class="form-control">
                                            <option value="high" {% if value_risk_speed == "high" %} selected="selected" {% endif %}>{{ text_high }}</option>
                                            <option value="medium" {% if value_risk_speed == "medium" %} selected="selected" {% endif %}>{{ text_medium }}</option>
                                            <option value="low" {% if value_risk_speed == "low" %} selected="selected" {% endif %}>{{ text_low }}</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">{{ label_paid_status }}</label>
                                <div class="col-sm-10">
                                    <select name="payment_globee_paid_status" class="form-control">
                                    {% for order_status in order_statuses %}
                                        {% if order_status['order_status_id'] == value_paid_status %}
                                            <option value="{{ order_status['order_status_id'] }}" selected="selected">{{ order_status['name'] }}</option>
                                        {% else %}
                                            <option value="{{ order_status['order_status_id'] }}">{{ order_status['name'] }}</option>
                                        {% endif %}
                                    {% endfor %}
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">{{ label_confirmed_status }}</label>
                                <div class="col-sm-10">
                                    <select name="payment_globee_confirmed_status" class="form-control">
                                        {% for order_status in order_statuses %}
                                            {% if order_status['order_status_id'] == value_confirmed_status %}
                                                <option value="{{ order_status['order_status_id'] }}" selected="selected">{{ order_status['name'] }}</option>
                                            {% else %}
                                                <option value="{{ order_status['order_status_id'] }}">{{ order_status['name'] }}</option>
                                            {% endif %}
                                        {% endfor %}
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">{{ label_completed_status }}</label>
                                <div class="col-sm-10">
                                    <select name="payment_globee_completed_status" class="form-control">
                                        {% for order_status in order_statuses %}
                                            {% if order_status['order_status_id'] == value_completed_status %}
                                                <option value="{{ order_status['order_status_id'] }}" selected="selected">{{ order_status['name'] }}</option>
                                            {% else %}
                                                <option value="{{ order_status['order_status_id'] }}">{{ order_status['name'] }}</option>
                                            {% endif %}
                                        {% endfor %}
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-notify-url">{{ label_notification_url }}</label>
                                <div class="col-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-link fa-fw"></i></span>
                                        <input type="url" name="payment_globee_notification_url" id="input-notify-url" value="{{ value_notification_url }}" class="form-control" />
                                    </div>
                                    {% if error_notification_url %}
                                        <div class="text-danger">{{ error_notification_url }}</div>
                                    {% endif %}
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-redirect-url">{{ label_redirect_url }}</label>
                                <div class="col-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-link fa-fw"></i></span>
                                        <input type="url" name="payment_globee_redirect_url" id="input-redirect-url" value="{{ value_redirect_url }}" class="form-control" />
                                    </div>
                                    {% if error_redirect_url %}
                                        <div class="text-danger">{{ error_redirect_url }}</div>
                                    {% endif %}
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-debug">{{ label_debugging }}</label>
                                <div class="col-sm-10">
                                    <select name="payment_globee_logging" id="input-debugging" class="form-control">
                                        <option value="1" {% if value_debugging == 1 %} selected="selected" {% endif %}>{{ text_enabled }}</option>
                                        <option value="0" {% if value_debugging == 0 %} selected="selected" {% endif %}>{{ text_disabled }}</option>
                                    </select>
                                </div>
                            </div>

                        </div>
                        <div class="tab-pane" id="tab-log">
                            <pre>{{ log }}</pre>
                            <div class="text-right">
                                <a href="{{ url_clear }}" class="btn btn-danger"><i class="fa fa-eraser"></i> {{ button_clear }}</a>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
{{ footer }}