require 'spec_helper'

describe AktionTestRails::Matchers::ActiveAdmin::Flash do
  include described_class
  include AktionTestRails::Support::Capybara::RackApp

  before :each do
    @app = capybara_rack_app do |env|
      case env['PATH_INFO']
      when '/test/flash'
        <<-HTML.strip_heredoc
          <div class="flash flash_notice">A flash message.</div>
        HTML
      end
    end
  end

  context 'with a flash notice and a message' do
    before(:each) { @app.visit '/test/flash' }
    subject { @app }
    it { should have_flash(:notice, 'A flash message.') }
    it { should_not have_flash(:notice, 'Another flash message.') }
    it { should_not have_flash(:alert, 'A flash message.') }
    it { should have_flash('A flash message.') }
    it { should_not have_flash('Another flash message.') }
    it { should have_flash(:notice) }
    it { should_not have_flash(:alert) }
    it { should have_flash }

    describe 'the failure message' do
      context 'when specifying a flash alert' do
        it 'explains that a wrong flash was found' do
          matcher = have_flash(:alert)
          matcher.matches?(@app)
          matcher.failure_message.should == <<-MSG.strip_heredoc
            Expected the page to have a flash alert.

            Found a flash notice.
          MSG
        end
      end

      context 'when specifying a different message' do
        it 'shows the expected and actual messages' do
          matcher = have_flash('Another flash message.')
          matcher.matches?(@app)
          matcher.failure_message.should == <<-MSG.strip_heredoc
            Expected the page to have a flash of `Another flash message.'.

            expected: Another flash message.
                 got: A flash message.
          MSG
        end
      end

      context 'when specifying a flash alert with a different message' do
        it 'shows the expected and actual message and explains that a wrong flash was found' do
          matcher = have_flash(:alert, 'Another flash message.')
          matcher.matches?(@app)
          matcher.failure_message.should == <<-MSG.strip_heredoc
            Expected the page to have a flash alert of `Another flash message.'.

            Found a flash notice.
            expected: Another flash message.
                 got: A flash message.
          MSG
        end
      end
    end

    describe 'the negative failure message' do
      context 'when specifying a matching flash type and message' do
        it 'explains that the type and message were not expected' do
          matcher = have_flash(:notice, 'A flash message.')
          matcher.matches?(@app)
          matcher.negative_failure_message.should == <<-MSG.strip_heredoc
            Did not expect the page to have a flash notice of `A flash message.'.

            Flash is a notice.
            Flash message is `A flash message.'.
          MSG
        end
      end

      context 'when specifying a matching flash type' do
        it 'explains that the type was not expected' do
          matcher = have_flash(:notice)
          matcher.matches?(@app)
          matcher.negative_failure_message.should == <<-MSG.strip_heredoc
            Did not expect the page to have a flash notice.

            Flash is a notice.
          MSG
        end
      end

      context 'when specifying a mathing flash message' do
        it 'explains that the message was not expected' do
          matcher = have_flash('A flash message.')
          matcher.matches?(@app)
          matcher.negative_failure_message.should == <<-MSG.strip_heredoc
            Did not expect the page to have a flash of `A flash message.'.

            Flash message is `A flash message.'.
          MSG
        end
      end

      context 'when specifying no flash' do
        it 'explains that a flash was found, including the type and message' do
          matcher = have_flash
          matcher.matches?(@app)
          matcher.negative_failure_message.should == <<-MSG.strip_heredoc
            Did not expect the page to have a flash.

            Found a flash notice of `A flash message.'.
          MSG
        end
      end
    end
  end

  context 'with no flash' do
    before(:each) { @app.visit '/test/no_flash' }
    subject { @app }
    it { should_not have_flash }

    context 'when specifying a flash' do
      it 'explains that a flash was not expected' do
        matcher = have_flash
        matcher.matches?(@app)
        matcher.failure_message.should == <<-MSG.strip_heredoc
          Expected the page to have a flash.

          No flash was found.
        MSG
      end
    end
  end
end

