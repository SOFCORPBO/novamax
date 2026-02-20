<div class="pos-tab-content">
    <div class="row">
        <div class="col-md-12">
            <div class="form-group">
                {!! Form::label('cash_denominations', __('lang_v1.cash_denominations') . ':') !!}
                 {!! Form::text('pos_settings[cash_denominations]', isset($pos_settings['cash_denominations']) ? $pos_settings['cash_denominations'] : null, ['class' => 'form-control', 'id' => 'cash_denominations']); !!}
                 <p class="help-block">{{__('lang_v1.cash_denominations_help')}}</p>
            </div>
        </div>

        <div class="col-sm-4">
            <div class="form-group">
                {!! Form::label('enable_cash_denomination_on', __('lang_v1.enable_cash_denomination_on') . ':') !!}
                {!! Form::select('pos_settings[enable_cash_denomination_on]', ['pos_screen' => __('lang_v1.pos_screen'), 'all_screens' => __('lang_v1.all_screen')], isset($pos_settings['enable_cash_denomination_on']) ? $pos_settings['enable_cash_denomination_on'] : 'pos_screen', ['class' => 'form-control', 'style' => 'width: 100%;' ]); !!}
            </div>
        </div>

        <div class="col-sm-4">
            <div class="form-group">
                {!! Form::label('enable_cash_denomination_for_payment_methods', __('lang_v1.enable_cash_denomination_for_payment_methods') . ':') !!}
                {!! Form::select('pos_settings[enable_cash_denomination_for_payment_methods][]', $payment_types, isset($pos_settings['enable_cash_denomination_for_payment_methods']) ? $pos_settings['enable_cash_denomination_for_payment_methods'] : null, ['class' => 'form-control select2', 'style' => 'width: 100%;', 'multiple' ]); !!}
            </div>
        </div>

        <div class="col-sm-4">
            <div class="form-group">
                <div class="checkbox">
                <br>
                  <label>
                    {!! Form::checkbox('pos_settings[cash_denomination_strict_check]', 1,  
                        !empty($pos_settings['cash_denomination_strict_check']) , 
                    [ 'class' => 'input-icheck']); !!} {{ __( 'lang_v1.strict_check' ) }}
                  </label>
                  @show_tooltip(__('lang_v1.strict_check_help'))
                </div>
            </div>
        </div>

        <div class="clearfix"></div>
        <hr>
        <div class="col-md-12">
            <h4>Configuración de Recargos por Método de Pago (%)</h4>
            <p class="help-block">Ingrese el porcentaje de recargo que se aplicará cuando el cliente pague con los siguientes métodos (Ej: 3 para un 3%).</p>
        </div>

        <div class="col-sm-3">
            <div class="form-group">
                {!! Form::label('card_surcharge', 'Recargo Tarjetas (%):') !!}
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-percent"></i></span>
                    {!! Form::text('card_surcharge', isset($business->card_surcharge) ? (float)$business->card_surcharge : 0, ['class' => 'form-control input_number', 'placeholder' => '0.00']); !!}
                </div>
            </div>
        </div>

        <div class="col-sm-3">
            <div class="form-group">
                {!! Form::label('custom_pay_1_surcharge', 'Recargo Pago Pers. 1 (PIX) (%):') !!}
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-percent"></i></span>
                    {!! Form::text('custom_pay_1_surcharge', isset($business->custom_pay_1_surcharge) ? (float)$business->custom_pay_1_surcharge : 0, ['class' => 'form-control input_number', 'placeholder' => '0.00']); !!}
                </div>
            </div>
        </div>

        <div class="col-sm-3">
            <div class="form-group">
                {!! Form::label('custom_pay_2_surcharge', 'Recargo Pago Pers. 2 (%):') !!}
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-percent"></i></span>
                    {!! Form::text('custom_pay_2_surcharge', isset($business->custom_pay_2_surcharge) ? (float)$business->custom_pay_2_surcharge : 0, ['class' => 'form-control input_number', 'placeholder' => '0.00']); !!}
                </div>
            </div>
        </div>

        <div class="col-sm-3">
            <div class="form-group">
                {!! Form::label('custom_pay_3_surcharge', 'Recargo Pago Pers. 3 (%):') !!}
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-percent"></i></span>
                    {!! Form::text('custom_pay_3_surcharge', isset($business->custom_pay_3_surcharge) ? (float)$business->custom_pay_3_surcharge : 0, ['class' => 'form-control input_number', 'placeholder' => '0.00']); !!}
                </div>
            </div>
        </div>
        </div>
</div>