module AktionTestRails
  module Matchers
    module ActiveAdmin
      module Flash
        def have_flash(type = nil, message = nil)
          type, message = nil, type if message.nil? && type.is_a?(String)
          Matcher.new(type, message)
        end

        class Matcher < AktionTest::Matchers::Base
          def initialize(type, message)
            @type, @message = type, message
          end

        protected
          
          def perform_match!
            has_flash? and has_flash_message?
          end
          
          def expectation
            expect = "the page to have a flash"
            unless @type.nil?
              expect << " #{@type.to_s}"
            end
            unless @message.nil?
              expect << " of `#{@message}'"
            end
            "#{expect}."
          end

          def problems_for_should
            message = "\n"
            unless has_flash?
              if @subject.has_selector? '.flash'
                message << "Found a flash #{find_flash_type}.\n"
              else
                message << "No flash was found.\n"
              end
            end
            unless has_flash_message?
              if @subject.has_selector? '.flash'
                message << "expected: #{@message}\n     got: #{flash_message}"
              end
            end
            message.chomp
          end

          def problems_for_should_not
            message = ""
            if @type.nil? && @message.nil?
              message << "\nFound a flash #{find_flash_type} of `#{flash_message}'."
            end
            if !@type.nil? && has_flash?
              message << "\nFlash is a #{find_flash_type}."
            end
            if !@message.nil? && has_flash_message?
              message << "\nFlash message is `#{flash_message}'."
            end
            message
          end

        private

          def find_flash_type
            @subject.find('.flash')[:class].split(' ')[1].gsub('flash_','')
          end

          def has_flash?
            @subject.has_selector? flash_selector
          end

          def has_flash_message?
            @message.nil? || flash_message == @message
          end

          def flash_message
            @subject.find('.flash').text
          end

          def flash_selector
            @type.nil? ? '.flash' : ".flash_#{@type.to_s}"
          end
        end
      end
    end
  end
end
