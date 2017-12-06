class Api::Worker::ApplicationController < Api::ApplicationController
  devise_group :worker, contains: [:worker]

  def application_status

    diff_raw = params['diff']
    unless diff_raw
      render(json: { error: '500 error' }, status: 500) && return
    end
    ret = {
      'summary' => {
        'field' => '合計申請額',
        'value' => '¥{10_000.to_s(:delimited)}-'
      }, 'entries' => [
        {
          'time' => '2017/10/10 10:10:10',
          'applied' => '¥{2_000.to_s(:delimited)}',
          'status' => 'approved'
        },
        {
          'time' => '2017/10/09 10:10:10',
          'applied' => '¥{1_000.to_s(:delimited)}',
          'status' => 'waiting'
        },
        {
          'time' => '2017/10/08 10:10:10',
          'applied' => '¥{3_000.to_s(:delimited)}',
          'status' => 'rejected'
        },
      ]
    }

    render json: ret
  end
end
