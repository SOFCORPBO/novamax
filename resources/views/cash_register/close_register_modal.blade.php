<div class="modal-dialog modal-lg" role="document">
  <div class="modal-content">
    {!! Form::open(['url' => action('CashRegisterController@postCloseRegister'), 'method' => 'post', 'id' => 'close_register_form' ]) !!}

    <div class="modal-header no-print">
      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      <h3 class="modal-title">@lang( 'cash_register.current_register' ) ( {{ \Carbon::createFromFormat('Y-m-d H:i:s', $register_details->open_time)->format('jS M, Y h:i A') }} - {{ \Carbon::now()->format('jS M, Y h:i A') }})</h3>
    </div>

    <div class="modal-body" id="print_area">
        <h4 class="text-center no-print" style="margin-bottom: 20px; font-weight:bold; color: #3c8dbc;"><i class="fas fa-list-alt"></i> Resumen de Ingresos</h4>
        
        <table class="table table-bordered table-striped" style="font-size: 14px;">
            <thead class="bg-primary" style="background-color: #3c8dbc; color:white;">
                <tr>
                    <th>@lang('lang_v1.payment_method')</th>
                    <th class="text-right">Monto Base</th>
                    <th class="text-right text-warning">+ Recargo</th>
                    <th class="text-right">@lang('sale.total')</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>@lang('cash_register.cash_in_hand') (Apertura):</td>
                    <td class="text-right"><span class="display_currency" data-currency_symbol="true">{{ $register_details->cash_in_hand }}</span></td>
                    <td class="text-right">-</td>
                    <td class="text-right font-weight-bold"><span class="display_currency" data-currency_symbol="true">{{ $register_details->cash_in_hand }}</span></td>
                </tr>
                <tr>
                    <td>@lang('cash_register.cash_payment'):</td>
                    <td class="text-right"><span class="display_currency" data-currency_symbol="true">{{ $register_details->total_cash }}</span></td>
                    <td class="text-right">-</td>
                    <td class="text-right font-weight-bold"><span class="display_currency" data-currency_symbol="true">{{ $register_details->total_cash }}</span></td>
                </tr>
                
                @php
                    // Calculo matemático inverso 100% seguro (sin tocar la BD). 
                    // Asumimos 5% para Tarjeta y 3% para Custom 1 (Pix).
                    $t_card = $register_details->total_card ?? 0;
                    $s_card = $t_card > 0 ? $t_card - ($t_card / 1.05) : 0;
                    $b_card = $t_card - $s_card;
                @endphp
                <tr>
                    <td>@lang('cash_register.card_payment'):</td>
                    <td class="text-right"><span class="display_currency" data-currency_symbol="true">{{ $b_card }}</span></td>
                    <td class="text-right text-danger">@if($s_card > 0) + <span class="display_currency" data-currency_symbol="true">{{ $s_card }}</span> @else - @endif</td>
                    <td class="text-right font-weight-bold"><span class="display_currency" data-currency_symbol="true">{{ $t_card }}</span></td>
                </tr>
                
                <tr>
                    <td>@lang('cash_register.cheque_payment'):</td>
                    <td class="text-right"><span class="display_currency" data-currency_symbol="true">{{ $register_details->total_cheque }}</span></td>
                    <td class="text-right">-</td>
                    <td class="text-right font-weight-bold"><span class="display_currency" data-currency_symbol="true">{{ $register_details->total_cheque }}</span></td>
                </tr>
                <tr>
                    <td>@lang('cash_register.bank_transfer'):</td>
                    <td class="text-right"><span class="display_currency" data-currency_symbol="true">{{ $register_details->total_bank_transfer }}</span></td>
                    <td class="text-right">-</td>
                    <td class="text-right font-weight-bold"><span class="display_currency" data-currency_symbol="true">{{ $register_details->total_bank_transfer }}</span></td>
                </tr>
                
                @php
                    $t_cp1 = $register_details->total_custom_pay_1 ?? 0;
                    $s_cp1 = $t_cp1 > 0 ? $t_cp1 - ($t_cp1 / 1.03) : 0; 
                    $b_cp1 = $t_cp1 - $s_cp1;
                @endphp
                <tr>
                    <td>{{ $payment_types['custom_pay_1'] ?? 'Pago Personalizado 1' }}:</td>
                    <td class="text-right"><span class="display_currency" data-currency_symbol="true">{{ $b_cp1 }}</span></td>
                    <td class="text-right text-danger">@if($s_cp1 > 0) + <span class="display_currency" data-currency_symbol="true">{{ $s_cp1 }}</span> @else - @endif</td>
                    <td class="text-right font-weight-bold"><span class="display_currency" data-currency_symbol="true">{{ $t_cp1 }}</span></td>
                </tr>
                
                <tr>
                    <td>{{ $payment_types['custom_pay_2'] ?? 'Pago Personalizado 2' }}:</td>
                    <td class="text-right"><span class="display_currency" data-currency_symbol="true">{{ $register_details->total_custom_pay_2 }}</span></td>
                    <td class="text-right">-</td>
                    <td class="text-right font-weight-bold"><span class="display_currency" data-currency_symbol="true">{{ $register_details->total_custom_pay_2 }}</span></td>
                </tr>
                <tr>
                    <td>{{ $payment_types['custom_pay_3'] ?? 'Pago Personalizado 3' }}:</td>
                    <td class="text-right"><span class="display_currency" data-currency_symbol="true">{{ $register_details->total_custom_pay_3 }}</span></td>
                    <td class="text-right">-</td>
                    <td class="text-right font-weight-bold"><span class="display_currency" data-currency_symbol="true">{{ $register_details->total_custom_pay_3 }}</span></td>
                </tr>
            </tbody>
            <tfoot class="bg-gray" style="background-color: #f2f2f2;">
                @php
                    $gran_base = ($register_details->cash_in_hand ?? 0) + ($register_details->total_cash ?? 0) + $b_card + ($register_details->total_cheque ?? 0) + ($register_details->total_bank_transfer ?? 0) + $b_cp1 + ($register_details->total_custom_pay_2 ?? 0) + ($register_details->total_custom_pay_3 ?? 0);
                    $gran_recargo = $s_card + $s_cp1;
                    $gran_total = $gran_base + $gran_recargo;
                @endphp
                <tr>
                    <th class="text-right">TOTAL GENERAL:</th>
                    <th class="text-right"><span class="display_currency" data-currency_symbol="true">{{ $gran_base }}</span></th>
                    <th class="text-right text-danger"><span class="display_currency" data-currency_symbol="true">{{ $gran_recargo }}</span></th>
                    <th class="text-right" style="font-size: 1.2em; color: #00a65a;"><span class="display_currency" data-currency_symbol="true">{{ $gran_total }}</span></th>
                </tr>
            </tfoot>
        </table>

        <hr class="no-print">
        
        {{-- DECLARACIÓN FISICA - LO QUE PIDIÓ EN EL WORD (FLECHAS AZULES) --}}
        <h4 class="text-center no-print" style="color: #d73925; font-weight: bold; margin-bottom: 15px;">Monto a Declarar</h4>
        <div class="row no-print">
            <div class="col-sm-4">
              <div class="form-group">
                {!! Form::label('closing_amount', __( 'cash_register.total_cash' ) . ':*') !!}
                  {!! Form::text('closing_amount', @num_format($register_details->cash_in_hand + $register_details->total_cash - $register_details->total_cash_refund), ['class' => 'form-control input_number', 'required', 'placeholder' => __( 'cash_register.total_cash' ) ]); !!}
              </div>
            </div>
            <div class="col-sm-4">
              <div class="form-group">
                {!! Form::label('total_card_slips', __( 'cash_register.total_card_slips' ) . ':*') !!} @show_tooltip(__('tooltip.total_card_slips'))
                  {!! Form::number('total_card_slips', $register_details->total_card_slips, ['class' => 'form-control', 'required', 'min' => 0, 'placeholder' => __( 'cash_register.total_card_slips' ) ]); !!}
              </div>
            </div> 
            <div class="col-sm-4">
              <div class="form-group">
                {!! Form::label('total_cheques', __( 'cash_register.total_cheques' ) . ':*') !!} @show_tooltip(__('tooltip.total_cheques'))
                  {!! Form::number('total_cheques', $register_details->total_cheques, ['class' => 'form-control', 'required', 'min' => 0, 'placeholder' => __( 'cash_register.total_cheques' ) ]); !!}
              </div>
            </div> 
        </div>

        <div class="row no-print">
            <div class="col-sm-12">
              <div class="form-group">
                {!! Form::label('closing_note', __( 'cash_register.closing_note' ) . ':') !!}
                  {!! Form::textarea('closing_note', null, ['class' => 'form-control', 'placeholder' => __( 'cash_register.closing_note' ), 'rows' => 3 ]); !!}
              </div>
            </div>
        </div>
    </div>

    <div class="modal-footer no-print">
      {{-- BOTÓN IMPRIMIR (FLECHA NARANJA) --}}
      <button type="button" class="btn btn-warning" onclick="printRegisterReport()" style="float: left;">
        <i class="fas fa-print"></i> Imprimir Reporte
      </button>
      
      <button type="button" class="btn btn-default" data-dismiss="modal">@lang( 'messages.cancel' )</button>
      <button type="submit" class="btn btn-primary">@lang( 'cash_register.close_register' )</button>
    </div>
    {!! Form::close() !!}
  </div></div><script>
    function printRegisterReport() {
        var printContents = document.getElementById('print_area').innerHTML;
        var printWindow = window.open('', '_blank', 'height=600,width=800');
        printWindow.document.write('<html><head><title>Reporte de Cierre</title>');
        printWindow.document.write('<style>');
        printWindow.document.write('body { font-family: Arial, sans-serif; padding: 20px; }');
        printWindow.document.write('table { width: 100%; border-collapse: collapse; margin-bottom: 20px; font-size:14px; }');
        printWindow.document.write('th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }');
        printWindow.document.write('th { background-color: #f2f2f2 !important; -webkit-print-color-adjust: exact; }');
        printWindow.document.write('.text-right { text-align: right; }');
        printWindow.document.write('.text-danger { color: #d9534f !important; }');
        printWindow.document.write('.no-print { display: none !important; }'); 
        printWindow.document.write('</style></head><body>');
        printWindow.document.write('<h2 style="text-align:center;">REPORTE DE CAJA</h2>');
        printWindow.document.write('<p><strong>Cajero:</strong> {{ auth()->user()->first_name }} {{ auth()->user()->last_name }}</p>');
        printWindow.document.write('<p><strong>Apertura:</strong> {{ \Carbon::createFromFormat("Y-m-d H:i:s", $register_details->open_time)->format("d/m/Y h:i A") }}</p>');
        printWindow.document.write('<p><strong>Cierre:</strong> {{ \Carbon::now()->format("d/m/Y h:i A") }}</p><br>');
        printWindow.document.write(printContents);
        printWindow.document.write('</body></html>');
        printWindow.document.close();
        setTimeout(function() {
            printWindow.print();
            printWindow.close();
        }, 300);
    }
</script>